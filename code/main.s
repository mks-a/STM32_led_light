.thumb
@This turns on Unified Assembly Language which is required to get all the features of Thumb-2.
.syntax unified					@ without this line "orr r0, r0, #0x200000" will give an error "unshifted register required" 

.equ STACKINIT, 0x20005000		@ end of SRAM 20kb

.text
.org 0x00000000					@ this not work!!!
SP: .word STACKINIT				@ 20kb of RAM, so I will put stack pointer to the end of it
RESET: .word main + 1
NMI_HANDLER: .word nmi_fault + 1
HARD_FAULT: .word hard_fault + 1
MEMORY_FAULT: .word memory_fault + 1
BUS_FAULT: .word bus_fault + 1
USAGE_FAULT: .word usage_fault + 1

.ifndef LED_DEF
.include "stm32f103c8t6_core/led.inc"
.endif

main:
	push {lr}
	bl led_init					@ call led init function
	pop {lr}
_main_loop:
	push {lr}
	bl led_light_on				@ branch to led_light_on and store next address that come after branch to link register (LR) to return (it used as call in x86 or AVR assembler)
	pop {lr}
	b _main_loop				@ branch to _main_loop and not load return address to link register (LR)
	@ return from function
	bx lr						@ indirect branch to link register address

nmi_fault:
	@ breakpoint
	bkpt
	bx lr
	
hard_fault:
	@ breakpoint
	bkpt
	bx lr

memory_fault:
	@ breakpoint
	bkpt
	bx lr

bus_fault:
	@ breakpoint
	bkpt
	bx lr

usage_fault:
	@ breakpoint
	bkpt
	bx lr	

@ this is dummy function that just return from interrupt
returtn_form_interrupt:
	@ breakpoint
	bkpt
	bx lr
	
.end
	