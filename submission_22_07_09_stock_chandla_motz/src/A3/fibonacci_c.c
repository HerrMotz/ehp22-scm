#include <stdint.h>

uint64_t fibonacci_c(uint64_t i_id ) {
    if (i_id == 0) {
        return 0;
    } else if (i_id == 1) {
        return 1;
    } else {
        return fibonacci_c(i_id-1) + fibonacci_c(i_id-2);
    }
}