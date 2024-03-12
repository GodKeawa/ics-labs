#include <coroutine>
#include <functional>
#include <queue>
#include <thread>

namespace coro {

static std::queue<std::function<bool()>> task_queue;  //一个功能接口队列

struct sleep {
    sleep(int n_ms) : delay{n_ms} {}

    std::chrono::milliseconds delay;

    // TODO: add functions to make sleep be an awaitable object
    bool await_ready() noexcept { return false; }    //默认进入suspend

    void await_suspend(std::coroutine_handle<> h) noexcept
    {
        task_queue.push([h, delay = delay]() -> bool    //传入一个lambda函数接口，捕捉handle和delay
            {
                std::this_thread::sleep_for(delay);     //暂停线程
                h.resume();                             //恢复协程，输出后再次co_await
                return h.done();                        //返回值要求是bool类型，在这里没有用，我的实现只要把队列运行完就行
            });
    }

    void await_resume() noexcept {}       
    
};

struct Task {
    // TODO: add functions to make Task be an coroutine handle
    struct promise_type{    //和之前的一样，只是取消了initial_suspend，不然就运行不了了

        Task get_return_object() noexcept { 
            return Task{std::coroutine_handle<promise_type>::from_promise(*this)};
        }

        std::suspend_never initial_suspend() noexcept { return {}; }  
        std::suspend_always final_suspend() noexcept { return {}; }        
        void return_void() noexcept {}
        void unhandled_exception(){}

        void resume() {
            std::coroutine_handle<promise_type>::from_promise(*this).resume();
        }
    };

    Task() noexcept = default;

    ~Task() noexcept {  //其实取消final_suspend就可以让编译器帮我destroy了
        if (coro) 
            coro.destroy();
    }

private:
    explicit Task(std::coroutine_handle<promise_type> coro) noexcept : coro(coro) {} 

    std::coroutine_handle<promise_type> coro; 


};

void wait_task_queue_empty() {
    // TODO: block current thread until task queue is empty 
    //来到这里时上面两个协程运行到co_await,push了两个接口进来,都已经suspend了
    while (!task_queue.empty())     //一直尝试调用接口直到没有接口在队列中
    {
        //提取最前面的接口并启动，线程sleep（传入的时间），然后协程被resume，输出后再次co_await传入一个接口或者输出后结束
        task_queue.front()();
        task_queue.pop();       //把接口pop出去
    }
    
}       

}  // namespace coro