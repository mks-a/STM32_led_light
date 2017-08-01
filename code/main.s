@This turns on Unified Assembly Language which is required to get all the features of Thumb-2.
.syntax unified					@ without this line "orr r0, r0, #0x200000" will give an error "unshifted register required" 

.equ STACKINIT, 0x00028000

.text
.org 0x00000000					@ this not work!!!
SP: .word STACKINIT				@ 20kb of RAM, so I will put stack pointer to the end of it
RESET: .word main @ + 1

.ifndef LED_DEF
.include "stm32f103c8t6_core/led.inc"
.endif

main:
	@bl led_init					@ call led init function
_main_loop:
	@bl led_light_on				@ branch to led_light_on and store next address that come after branch to link register (LR) to return (it used as call in x86 or AVR assembler)
	b _main_loop				@ branch to _main_loop and not load return address to link register (LR)
	@ return from function
	bx lr						@ indirect branch to link register address
	
@delay:
	@ return from function
@	bx lr
	
.end
	