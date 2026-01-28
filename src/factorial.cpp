#include "factorial.hpp"

namespace %%cpp_init_replace%% {
long long factorial(long long n) {
    long long out = 1;
    for (long long i = 1; i <= n; ++i)
        out *= i;

    return out;
}
}  // namespace %%cpp_init_replace%%
