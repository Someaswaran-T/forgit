#include <stdio.h>

int main() {
    int x = 10;
    int y;

    // Original code: Expensive operations (multiplication and division)
    y = x * 4;  // multiplication by a constant
    printf("Original y (x * 4) = %d\n", y);

    y = x / 2;  // division by a constant
    printf("Original y (x / 2) = %d\n", y);

    // Optimized code: Using strength reduction
    y = x << 2;  // multiply by 8 using left shift (x * 2^3)
    printf("Optimized y (x << 2) = %d\n", y);

    y = x >> 1;  // divide by 2 using right shift (x / 2^1)
    printf("Optimized y (x >> 1) = %d\n", y);

    return 0;
}
