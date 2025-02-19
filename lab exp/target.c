#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to generate target code for a simple arithmetic expression
void generate_target_code(char* intermediate_code) {
    char op1[20], op2[20], result[20], operator[3];
    float num;

    // Parse the intermediate code and generate corresponding target code
    if (sscanf(intermediate_code, "%s = %s %s %s", result, op1, operator, op2) == 4) {
        // If it's a multiplication or addition, generate appropriate target code
        if (strcmp(operator, "*") == 0) {
            printf("LOAD R1, %s\n", op1); // Load operand into register R1
            printf("MUL R1, %s\n", op2); // Multiply with the second operand
            printf("STORE %s, R1\n", result); // Store result in the variable
        } else if (strcmp(operator, "+") == 0) {
            printf("LOAD R1, %s\n", op1); // Load operand into register R1
            printf("ADD R1, %s\n", op2);  // Add to the second operand
            printf("STORE %s, R1\n", result); // Store result in the variable
        }
    } else if (sscanf(intermediate_code, "%s = %f", result, &num) == 2) {
        // If the assignment is to a constant, just store it in the variable
        printf("LOAD R1, %f\n", num);  // Load constant value into register R1
        printf("STORE %s, R1\n", result);  // Store the value in the result variable
    }
}

int main() {
    char intermediate_code1[] = "templ = id3 * 60.00";
    char intermediate_code2[] = "id1 = id2 + temp1";

    // Generate target code for the intermediate code
    printf("Generating target code for intermediate code 1:\n");
    generate_target_code(intermediate_code1);

    printf("\nGenerating target code for intermediate code 2:\n");
    generate_target_code(intermediate_code2);

    return 0;
}
