################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../src/Exercícios.s \
../src/calculator_up201906045_1MIEIC01.s \
../src/estep_up201906045_1MIEIC01.s \
../src/freqchars_up201906045_1MIEIC01.s 

C_SRCS += \
../src/pratica3.c 

OBJS += \
./src/Exercícios.o \
./src/calculator_up201906045_1MIEIC01.o \
./src/estep_up201906045_1MIEIC01.o \
./src/freqchars_up201906045_1MIEIC01.o \
./src/pratica3.o 

C_DEPS += \
./src/pratica3.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.s
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


