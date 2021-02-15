################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../src/Adicionais.s \
../src/Exercício\ para\ entregar\ 1.s \
../src/checkrange_up201906045_1MIEIC01.s \
../src/countcommon_up201906045_1MIEIC01.s \
../src/ex1_up201906045_1MIEIC01.s \
../src/exercício_1.s \
../src/soma.s 

C_SRCS += \
../src/pratica2.c 

OBJS += \
./src/Adicionais.o \
./src/Exercício\ para\ entregar\ 1.o \
./src/checkrange_up201906045_1MIEIC01.o \
./src/countcommon_up201906045_1MIEIC01.o \
./src/ex1_up201906045_1MIEIC01.o \
./src/exercício_1.o \
./src/pratica2.o \
./src/soma.o 

C_DEPS += \
./src/pratica2.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.s
	@echo 'Building file: $<'
	@echo 'Invoking: GCC Assembler 7.3.1 [aarch64-elf]'
	aarch64-elf-as.exe -g -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/Exercício\ para\ entregar\ 1.o: ../src/Exercício\ para\ entregar\ 1.s
	@echo 'Building file: $<'
	@echo 'Invoking: GCC Assembler 7.3.1 [aarch64-elf]'
	aarch64-elf-as.exe -g -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler 7.3.1 [aarch64-elf]'
	aarch64-elf-gcc.exe -O0 -g -Wall -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


