
@ Syscall defines
.equ SYSCALL_EXIT,     1


        .globl _start
_start:

        @================================
        @ Exit
        @================================
exit:
	
	@Moves 42 to r0 to return it and then the system exits
	mov r0, #42 
	mov r7, #SYSCALL_EXIT
	swi 0x0

