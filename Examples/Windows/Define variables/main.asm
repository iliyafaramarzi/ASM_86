section .data
    myVar1 db 0xA      ; Define a byte variable with value of 10 as hex number
    myVar2 db 11       ; Define a byte variable with value of 10 as decimal number
    myVar3 db 0o14     ; Define a byte variable with value of 10 as octal number

section .text
    global start

start:
    ret