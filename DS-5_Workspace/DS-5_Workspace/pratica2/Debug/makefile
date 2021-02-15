################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := clean

# All of the sources participating in the build are defined here
-include sources.mk
-include src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: pratica2.axf

# Tool invocations
pratica2.axf: $(OBJS)  $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: GCC C Linker 7.3.1 [aarch64-elf]'
	aarch64-elf-gcc.exe --specs=aem-ve.specs -o "pratica2.axf" "src/Adicionais.o" "src/Exercício para entregar 1.o" "src/checkrange_up201906045_1MIEIC01.o" "src/countcommon_up201906045_1MIEIC01.o" "src/ex1_up201906045_1MIEIC01.o" "src/exercício_1.o" "src/pratica2.o" "src/soma.o" $(LIBS) $(USER_OBJS)
	@echo 'Finished building target: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(EXECUTABLES) src/Adicionais.o "src/Exercício para entregar 1.o" src/checkrange_up201906045_1MIEIC01.o src/countcommon_up201906045_1MIEIC01.o src/ex1_up201906045_1MIEIC01.o src/exercício_1.o src/pratica2.o src/soma.o $(C_DEPS) pratica2.axf 
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
