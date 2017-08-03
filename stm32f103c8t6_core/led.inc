LED_DEF = 0

.text

.ifndef GPIO_DEF
.include "stm32f103c8t6_core/gpio.inc"
.endif

@ this function ititialize port C pin 13 for output
@ function not recieve nor return any parameters
led_init:
	push {r0, r1}
	
	push {lr}
	bl gpio_port_c_rcc_init
	pop {lr}
	
	@ read value from GPIOC_CRH register
	ldr r1, =GPIOC_CRH						@ set register with 32 bit constant (GPIOC_CRH)
	ldr r0, [r1]							@ load value from address on r1 register to r0 register
	@ set bits in r0 register	
	@orr r0, r0, 0x2000000		@ for PC14 (set bit 25 (mode 14))	
	@and r0, r0, 0xF3FFFFFF		@ for PC14

	orr r0, r0, 0x200000					@ bitwise or value from r0 register to immediate (0x200000) and put result to r0 register
	and r0, r0, 0xFF3FFFFF					@ clear 23:22 bits (CNF13 = push-pull)
	
	@ store value from r0 to GPIOC_CRH	
	str r0, [r1]
	
	@ check stored value
	@ldr r0, [r1]
	
	@ breakpoint
	@bkpt
	
	pop {r0, r1}
	
	@ return from function
	bx lr

@ this function light STM32 onboard led
@ this function does not recieve nor return any parameter
led_light_on:
	push {r0, r1}
	
	@ set address of GPIOC_ODR to r1 register
	ldr r1, =GPIOC_ODR
	
	@ set r0 to led flash on value
	@ldr r0, =0x2000
	ldr r0, =0x4000
	
	@ store value from r0 to memory location in r1
	str r0, [r1]
	
	pop {r0, r1}
	@ return from function
	bx lr
