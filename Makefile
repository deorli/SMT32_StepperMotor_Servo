################################################################################################
#   File           : Makefile
#   Author         : Mateusz Bator
#   Brief          : Startup file with information on compilation, flashing
#	############################################################################################
#   Copyright (c) Bator Mateusz 
#   email: deorli@o2.pl
#   
#   All rights reserved.
#   
#   This software is licensed under terms that can be found in the LICENSE file
#   in the root directory of this software project.
################################################################################################

###########################################	  TODO	 ###########################################
#TODO: Adding protection against flashing an oversized program
################################################################################################

# When the first parameter is empty (e.g. make)
ifeq ($(MAKECMDGOALS),$(filter $(MAKECMDGOALS),))
print_information: information
endif

# When the first parameter is "help" (e.g. make help)
ifeq ($(MAKECMDGOALS),$(filter $(MAKECMDGOALS), help))
print_help: help
endif

ROOT_DIR:=$(realpath $(shell dirname $(firstword $(MAKEFILE_LIST))))

# Write information in the console on how to use the help command
information:
	@echo     Call: make help \ \ \ \ \ \ \ \ - to get information how to build, debug, compile etc.

# Write information in the console about available commands
help:
	@echo	  #
	@echo	  '###################################################################################################################'
	@echo	  How use this build system:
	@echo	  -------------------------------------------------------------------------------------------------------------------
	@echo	  1. Call: make app  \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ -To compile app - Firmware for MCU '('without debug information')'
	@echo	  2. Call: make flash  \ \ \ \ \ \ \ \ \ \ \ \ \ -To compile and flash app - Firmware for MCU '('without debug information')'
	@echo	  3. Call: make debug  \ \ \ \ \ \ \ \ \ \ \ \ \ -To compile App with Debug information
	@echo	  4. Call: make flash-debug  \ \ \ \ \ \ \ -To compile App with Debug information and flash Firmware in MCU
	@echo	  -------------------------------------------------------------------------------------------------------------------
	@echo	  5. Call: make clean-build  \ \ \ \ \ \ \ -Remove build Folder
	@echo	  6. Call: make clean-debug  \ \ \ \ \ \ \ -Remove build Debug Folder
	@echo	  -------------------------------------------------------------------------------------------------------------------
	@echo	  7. Call: make cppcheck  \ \ \ \ \ \ \ \ \ \ -Run static analisis
	@echo	  '###################################################################################################################'

# Include makefile for debugging and flashing STM32F3
ifeq ($(MAKECMDGOALS),$(filter $(MAKECMDGOALS), app flash debug flash-debug clean-build clean-debug cppcheck))
include Makefiles/main_Makefile
endif