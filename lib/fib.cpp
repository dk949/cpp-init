#include "helper.hpp"

#include <%%cpp_init_replace%%/fib.hpp>

namespace %%cpp_init_namespace%% {
long long fib(long long n) {
    long long last = 1;
    long long current = 1;
    for (long long i = 1; i < n - 1; ++i) {
        last = detail::myExchange(current, current + last);
    }
    return current;
}
}  // namespace %%cpp_init_namespace%%
