:: -g generate debug information
:: -c compile only
:: https://gcc.gnu.org/onlinedocs/gcc/Option-Index.html 
:: http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.dui0553a/CIHJJEIH.html
:: http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.dui0552a/BABIFJFG.html - cortex-m3 vector table
cls
"E:\ARM_Toolchain\gcc-arm-none-eabi-6-2017-q2-update-win32\bin\arm-none-eabi-as" -mcpu=cortex-m3 -g .\code\main.s -o main.o
"E:\ARM_Toolchain\gcc-arm-none-eabi-6-2017-q2-update-win32\bin\arm-none-eabi-ld" -Ttext=0x0 -o main.elf main.o
"E:\ARM_Toolchain\gcc-arm-none-eabi-6-2017-q2-update-win32\bin\arm-none-eabi-objcopy" -O binary main.elf main.bin

