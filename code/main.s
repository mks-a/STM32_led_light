.text

.equ STACKINIT, 0x00028000

.org 0x00000000
SP: .word STACKINIT				@ 20kb of RAM, so I will put stack pointer to the end of it
RESET: .word main + 1

main:
_main_loop:
	@bl delay					@ branch to delay and store next address that come after branch to link register (LR) to return (it used as call in x86 or AVR assembler)
	b _main_loop				@ branch to _main_loop and not load return address to link register (LR)
	@ return from function
	bx lr						@ indirect branch to link register address
	
delay:
	@ return from function
	bx lr
	
.end
	