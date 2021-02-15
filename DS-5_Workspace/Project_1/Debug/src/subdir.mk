################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../src/soma.s 

C_SRCS += \
../src/Projeto1.c 

OBJS += \
./src/Projeto1.o \
./src/soma.o 

C_DEPS += \
./src/Projeto1.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler 7.3.1 [aarch64-elf]'
	aarch64-elf-gcc.exe -O0 -g -Wall -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/%.o: ../src/%.s
	@echo 'Building file: $<'
	@echo 'Invoking: GCC Assembler 7.3.1 [aarch64-elf]'
	aarch64-elf-as.exe -g -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


