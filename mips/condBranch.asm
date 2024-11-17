.data
result: .word 0

.text
.globl main
main:    
    li $t0, 15         # Load immediate value 15 into $t0
    li $t1, 10         # Load immediate value 10 into $t1
    li $t2, 0          # Initialize result with 0

    bge $t0, $t1, store # Branch if $t0 >= $t1
    li $t2, 1          # If less than, set $t2 to 1

store:
    sw $t2, result     # Store result in memory

end:
    nop                # End of program

