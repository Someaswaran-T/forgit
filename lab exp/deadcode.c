#include <stdio.h>
#include <string.h>

typedef struct {
    char var[10];
    char expr[50];
    int is_used;
} Code;

int main() {
    Code code[5] = {
        {"a", "9", 0},
        {"b", "c+d", 0},
        {"e", "c+d", 0},
        {"f", "b+e", 0},
        {"r", "f", 1}
    };

    // Mark all variables used in final computation
    for (int i = 4; i >= 0; i--) {
        if (code[i].is_used) {
            for (int j = 0; j < i; j++) {
                if (strstr(code[i].expr, code[j].var)) {
                    code[j].is_used = 1;
                }
            }
        }
    }

    // Output optimized code
    printf("Optimized Code:\n");
    for (int i = 0; i < 5; i++) {
        if (code[i].is_used) {
            printf("%s = %s\n", code[i].var, code[i].expr);
        }
    }

    return 0;
}
