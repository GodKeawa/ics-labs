#pragma once

#include <coroutine>
#include <iterator>
#include <utility>
#include <stdio.h>

namespace coro
{
    template <typename Ref, typename Value = std::remove_cvref_t<Ref>>
    class generator
    {
    public:
        // TODO: implement promise_type
        class promise_type{
        private:
            friend generator;
            union
            {
                promise_type *root;             //协程树的根，即第一个协程
                promise_type *leaf;             //协程树的叶，即这个协程的下属嵌套协程
            };  
            promise_type *parent = nullptr;     //记录协程的调用者，即parent
            std::add_pointer_t<Ref> data;

        public:
            promise_type() : root(this) {}
            generator get_return_object() noexcept
            {
                return generator{std::coroutine_handle<promise_type>::from_promise(*this)};
            }

            void unhandled_exception() {}

            void return_void() noexcept {}

            std::suspend_always initial_suspend() noexcept { return {}; }

             struct yield_awaiter{
                generator gen;
                explicit yield_awaiter(generator &&g) noexcept
                    //传递generator的handle，保证handle正确使用.destroy()
                {
                    //exchange将g.coro置空并让gen.coro = g.coro
                    gen.coro = std::exchange(g.coro, {});  
                }

                bool await_ready() noexcept
                {
                    return !gen.coro;       //如果从g里面什么都没拿到，就直接resume
                }                           //如果拿到一个协程，就得到await_suspend里面处理

                std::coroutine_handle<> await_suspend(std::coroutine_handle<promise_type> h) noexcept
                {
                    auto &current = h.promise();            //取出当前协程promise对象
                    auto &nested = gen.coro.promise();      //取出嵌套协程promise对象
                    auto &root_ = current.root;             //取出当前协程的root

                    nested.root = root_;             //把嵌套协程的root设为当前协程的root                   
                    nested.parent = &current;        //把嵌套协程的parent设为当前协程
                    root_->leaf = &nested;           //把当前root的leaf设为嵌套协程

                    return gen.coro;               //进入嵌套协程的generator
                }

                void await_resume() {}
            };

            yield_awaiter yield_value(generator &&g) noexcept
            {//当co_yield一个generator时生成一个yield_awaiter对象并传入参数
                return yield_awaiter{std::move(g)};
            }

            //某个协程结束后需要尝试将控制交还给它的调用者
            struct final_awaiter
            {
                bool await_ready() noexcept{ return false; }

                std::coroutine_handle<> await_suspend(std::coroutine_handle<promise_type> h) noexcept
                {
                    auto &promise = h.promise();         //先把协程的promise对象取出来
                    auto parent_ = h.promise().parent;   //再把协程的调用者取出来
                    if (parent_)                         //如果有调用者就返回调用者
                    {
                        promise.root->leaf = parent_;    //修改root的leaf到上一层
                        return std::coroutine_handle<promise_type>::from_promise(*parent_);
                    }
                    return std::noop_coroutine();       //没有调用者就直接等着，这个handle啥也不干
                }
                void await_resume() noexcept {}
            };

            final_awaiter final_suspend() noexcept { return {}; }

            std::suspend_always yield_value(Ref &x) noexcept
            {
                root->data = std::addressof(x);
                return {};
            }

            void resume()
            {
                std::coroutine_handle<promise_type>::from_promise(*leaf).resume();
            }
        };

        generator() noexcept = default;

        ~generator() noexcept
        {
            /* TODO */
            if (coro)
            {
                coro.destroy();
            }
        }

        class iterator
        {
        public:
            using iterator_category = std::input_iterator_tag;
            using difference_type = std::ptrdiff_t;
            using value_type = Value;
            using reference = Ref;
            using pointer = std::add_pointer_t<Ref>;

            iterator() noexcept = default;
            iterator(const iterator &) = delete;
            iterator(iterator &&o)
            {
                std::swap(coro_, o.coro_);
            }

            iterator &operator=(iterator &&o)
            {
                std::swap(coro_, o.coro_);
                return *this;
            }

            ~iterator() {}

            // TODO: implement operator== and operator!=
            // TODO: implement operator++ and operator++(int)
            // TODO: implement operator* and operator->
            friend bool operator==(const iterator &it, std::default_sentinel_t) noexcept
            {
                return !it.coro_ || it.coro_.done();
            }
            friend bool operator!=(const iterator &it, std::default_sentinel_t) noexcept
            {
                return it.coro_ && !it.coro_.done();
            }

            iterator &operator++()
            {
                coro_.promise().resume();
                return *this;
            }
            void operator++(int)
            {
                (void)operator++();
            }

            reference operator*() const noexcept
            {
                return *coro_.promise().data;
            }

            pointer operator->() const noexcept
            {
                return std::addressof(operator*());
            }

        private:
            friend generator;

            // TODO: implement iterator constructor
            // hint: maybe you need to a promise handle
            using coroutine_handle = std::coroutine_handle<promise_type>;
            explicit iterator(coroutine_handle coro) noexcept : coro_(coro) {}

            // TODO: add member variables you need
            coroutine_handle coro_;
        };

        // TODO: implement begin() and end() member functions
        iterator begin()
        {
            if (coro)
            {
                coro.resume();
            }
            return iterator{coro};
        }

        std::default_sentinel_t end() noexcept { return {}; }

    private:
        // TODO: implement generator constructor
        explicit generator(std::coroutine_handle<promise_type> coro) noexcept : coro(coro) {}

        // TODO: add member variables you need
        std::coroutine_handle<promise_type> coro;
    };

} // namespace coro
