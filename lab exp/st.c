#include <stdio.h>
#include <string.h>

void optimize(char *code) {
    if (strstr(code, "* 4")) {
        printf("Optimized code: %s\n", strstr(code, "* 4") ? "x = x << 2;" : code);
    } else {
        printf("No optimization needed.\n");
    }
}

int main() {
    char code[100];
    printf("Enter original code: ");
    fgets(code, sizeof(code), stdin);

    // Remove trailing newline, if present
    code[strcspn(code, "\n")] = 0;

    printf("Original code: %s\n", code);
    optimize(code);

    return 0;
}
