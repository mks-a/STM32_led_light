GPIO_DEF = 0

.ifndef STM32F103C8T6_REGISTERS
.include "stm32f103c8t6_core/registers.inc"
.endif

@ this function initialize rcc registers for using gpio pins

gpio_port_c_rcc_init:
	push {r0, r1}
	@ set RCC_CFGR registerto system clock
	ldr r1, =RCC_CFGR		@ load address of RCC_CFGR registers
	ldr r0, =0x4000000
	str r0, [r1]			@ store value from r0 to address in r1
	@ set RCC_APB2RSTR register values for using port C
	ldr r1, =RCC_APB2RSTR
	ldr r0, =0x10
	str r0, [r1]
	@ set RCC_APB2ENR register values for using port C
	ldr r1, =RCC_APB2ENR
	str r0, [r1]		@ strore the same value as for RCC_APB2RSTR to RCC_APB2ENR register
	
	pop {r0, r1}
	bx lr
