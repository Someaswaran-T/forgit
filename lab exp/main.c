#include <stdio.h>
#include <string.h>

#define MAX 100

void generate_assembly(char op, char arg1[], char arg2[], char res[]) {
    if (op == '+') {
        printf("MOV AX, %s\n", arg1);
        printf("ADD AX, %s\n", arg2);
        printf("MOV %s, AX\n", res);
    } else if (op == '-') {
        printf("MOV AX, %s\n", arg1);
        printf("SUB AX, %s\n", arg2);
        printf("MOV %s, AX\n", res);
    } else if (op == '*') {
        printf("MOV AX, %s\n", arg1);
        printf("MOV BX, %s\n", arg2);
        printf("MUL BX\n");
        printf("MOV %s, AX\n", res);
    } else if (op == '/') {
        printf("MOV AX, %s\n", arg1);
        printf("MOV BX, %s\n", arg2);
        printf("DIV BX\n");
        printf("MOV %s, AX\n", res);
    } else if (strcmp(&op, "=") == 0) {
        printf("MOV %s, %s\n", res, arg1);
    } else if (strcmp(&op, "JMP") == 0) {
        printf("JMP %s\n", res);
    } else if (strcmp(&op, "IF") == 0) {
        printf("CMP %s, %s\n", arg1, arg2);
        printf("JE %s\n", res);
    }
}

int main() {
    int n;
    printf("Enter the number of three-address code instructions: ");
    scanf("%d", &n);

    printf("Enter the TAC instructions (format: op arg1 arg2 result):\n");
    char op[MAX], arg1[MAX], arg2[MAX], res[MAX];
    for (int i = 0; i < n; i++) {
        scanf("%s %s %s %s", op, arg1, arg2, res);
        generate_assembly(op[0], arg1, arg2, res);
    }

    return 0;
}
