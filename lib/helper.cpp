
#include "helper.hpp"

#include <utility>

namespace %%cpp_init_namespace%%::detail {
long long myExchange(long long &num, long long new_val) {
    return std::exchange(num, new_val);
}
}  // namespace %%cpp_init_namespace%%::detail
