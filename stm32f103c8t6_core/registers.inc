STM32F103C8T6_REGISTERS = 0 

.ifndef STM32F103C8T6_PORT_CODES
.include "stm32f103c8t6_core/ports.inc"
.endif			

.equ GPIOC_CRL, PORT_C				@ port C control register low
.equ GPIOC_CRH, PORT_C + 0x04		@ port C control register high
.equ GPIOC_IDR, PORT_C + 0x08		@ port C input data register
.equ GPIOC_ODR, PORT_C + 0x0C		@ port C output data register
.equ PIOC_BSRR, PORT_C + 0x10		@ port C bit set/reset register
.equ GPIOC_BRR, PORT_C + 0x14		@ port C bit reset register (16 bit)
.equ GPIOC_LCKR, PORT_C + 0x18		@ port C configuration lock register