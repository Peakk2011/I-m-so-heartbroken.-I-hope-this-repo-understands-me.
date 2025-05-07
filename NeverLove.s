.section .data
    message: .string "Love you so much"
    love_value: .byte 100

.section .bss
    .lcomm result, 20

.section .text
    .global _start

_start:
    movq $message, %rsi
    call PrintMessage

    movb love_value, %al
    call ExpressLove

    movq $60, %rax
    xorq %rdi, %rdi
    syscall

PrintMessage:
    movq $1, %rax
    movq $1, %rdi
    movq $10, %rdx
    syscall
    ret

ExpressLove:
    movq $result, %rdi
    movq $10, %rbx
    xorq %rcx, %rcx
    divb %bl
    addb $'0', %dl
    movb %dl, (%rdi)
    ret
