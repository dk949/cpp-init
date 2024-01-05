#include "factorial.hpp"

long long factorial(unsigned int i) {
    if (i == 0 || i == 1) return 1;
    return i * factorial(i - 1);
}
