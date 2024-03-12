#pragma once

#include <coroutine>
#include <iterator>
#include <utility>


namespace coro {

template <typename Ref, typename Value = std::remove_cvref_t<Ref>>
class generator {
public:
    // TODO: implement promise_type
    class promise_type{
    private:
        friend generator;
        std::add_pointer_t<Ref> data;               //data保存参数
    public:
    //promise_type必须实现的函数
        generator get_return_object() noexcept{ //创建handle并为generator载入handle    
            return generator{std::coroutine_handle<promise_type>::from_promise(*this)};
        }

        std::suspend_always initial_suspend() noexcept { return {}; }  //下面的基本就是默认结构

        void return_void() noexcept {}

        void unhandled_exception(){}

        std::suspend_always final_suspend() noexcept { return {}; }

        std::suspend_always yield_value(Ref &x) noexcept    //将yield的参数保存到data字段里
        {
            data = std::addressof(x);
            return {};
        }
    //resume也放到promise_type里面
        void resume() {
            std::coroutine_handle<promise_type>::from_promise(*this).resume();//取出handle然后调用resume
        }
    };

    generator() noexcept = default;

    ~generator() noexcept {
        /* TODO */
        if (coro)                   //直接用handle销毁
            coro.destroy();
    }

    class iterator {
    public:
        using iterator_category = std::input_iterator_tag;
        using difference_type = std::ptrdiff_t;
        using datatype = Value;
        using reference = Ref;
        using pointer = std::add_pointer_t<Ref>;

        iterator() noexcept = default;
        iterator(const iterator&) = delete;
        iterator(iterator&& o) {
            std::swap(coro_, o.coro_);
        }

        iterator& operator=(iterator&& o) { 
            std::swap(coro_, o.coro_);
            return *this;
        }

        ~iterator() {}

        // TODO: implement operator== and operator!=
        // TODO: implement operator++ and operator++(int)
        // TODO: implement operator* and operator->

        //双目运算符类内实现，且需要支持管道操作
        friend bool operator==(const iterator &it, std::default_sentinel_t) noexcept {
            return !it.coro_ || it.coro_.done();
        }
        friend bool operator!=(const iterator &it, std::default_sentinel_t) noexcept {
            return it.coro_ && !it.coro_.done();
        }

        iterator &operator++() {
            coro_.promise().resume();
            return *this;
        }
        void operator++(int) {
            (void)operator++();
        }

        reference operator*() const noexcept {
            return *coro_.promise().data;
        }

        pointer operator->() const noexcept {
            return std::addressof(operator*());
        }

    private:
        friend generator;

        // TODO: implement iterator constructor
        // hint: maybe you need to a promise handle

        using coroutine_handle = std::coroutine_handle<promise_type>;       //迭代器内置一个handle
        explicit iterator(coroutine_handle coro) noexcept : coro_(coro) {}  //构造函数传入handle

        // TODO: add member variables you need
        coroutine_handle coro_;
    };

    // TODO: implement begin() and end() member functions
    iterator begin() {          //创建迭代器，传入generator的handle
        if (coro) {
            coro.resume();
        }
        return iterator{coro};
    }
    std::default_sentinel_t end() noexcept { return {}; }

private:
    // TODO: implement generator constructor
    explicit generator(std::coroutine_handle<promise_type> coro) noexcept : coro(coro) {}   //构造函数传入handle

    // TODO: add member variables you need
    std::coroutine_handle<promise_type> coro;   //handle
};


}  // namespace coro
