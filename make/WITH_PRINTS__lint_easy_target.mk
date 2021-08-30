
# target.mk template last updated for lint-easy version 1.0.0
# See lint_easy/README.md for more information


#VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
# DO NOT TOUCH
#VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
DESIGN_REPO_TOP = $(DUT_TOP_DIR)/..
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
# DO NOT TOUCH
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


##############################################################################################################
#  Frequently Changed
##############################################################################################################

# Desired Vivado Version
# This value is used to determine environment variable names detailed in the lint_easy README to find the
# correct Vivado library paths if needed
VIVADO_VERSION = 2018.3


# The below lines define the paths to all VHDL files to analyze.
# All paths must be relative to the root dir. of the main firmware project repository - $(DESIGN_REPO_TOP)
# EXAMPLE:
# DESIGN_SRC_FILES = \
#                    $(wildcard $(DESIGN_REPO_TOP)/ip_repo/adxl345_ep/src/hdl/*.vhd) \
#                    $(wildcard $(DESIGN_REPO_TOP)/ip_repo/axi_intr_cntl/src/hdl/axi_intr_cntl.vhd) \
#                    $(wildcard $(DESIGN_REPO_TOP)/ip_repo/axi_intr_cntl/src/hdl/axi_intr_cntl_slave.vhd) \
#                    $(wildcard $(DESIGN_REPO_TOP)/src/hdl/soc_0246.vhd)
DESIGN_SRC_FILES = \
                   $(wildcard $(DESIGN_REPO_TOP)/src/hdl/*.vhd) \


##############################################################################################################
#  Infrequently Changed
##############################################################################################################

# DESIGN_SRC_FILES that should not be linted
# Add any files that were needed in DESIGN_SRC_FILES above to compile, but that should not be linted
# Please only use this when ABSOLUTELY NECESSARY
# EXAMPLE: No blackbox files needed
# DESIGN_BLACKBOX_FILES = 
# EXAMPLE: If utility_package.vhd was added to DESIGN_SRC_FILES but should not be linted 
# DESIGN_BLACKBOX_FILES = \
#                         $(wildcard $(DESIGN_REPO_TOP)/src/hdl/utility_package.vhd)
DESIGN_BLACKBOX_FILES = 


# Specify the VHDL dialect to read input files with. By default, the dialect is VHDL_93.
# Valid options are: VHDL_87, VHDL_93, VHDL_2002, VHDL_2008
VHDL_DIALECT = VHDL_93


# Reference external libraries
# NOTE: Only the top level package defining types, components, and constants need be referenced
# Example Usages:
#    EXT_LIBRARIES = unisim xpm - Include both UNISIM and XPM libs
#    EXT_LIBRARIES = unisim     - Include only UNISIM lib
#    EXT_LIBRARIES = xpm        - Include only XPM lib
#    EXT_LIBRARIES =            - Include no external lbs
EXT_LIBRARIES = unisim xpm


#VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
# DO NOT TOUCH
#VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
# set library file paths based on VIVADO_BAT_PATH_<VERSION> system env. var.
VIVADO_BAT_PATH_ENV_VAR_NAME = VIVADO_BAT_PATH_$(subst .,_,$(VIVADO_VERSION))
VIVADO_BAT_PATH = $(value $(VIVADO_BAT_PATH_ENV_VAR_NAME))
VIVADO_BIN_DIR_PATH = $(dir $(VIVADO_BAT_PATH))
VIVADO_VER_DIR_PATH = $(realpath $(VIVADO_BIN_DIR_PATH)\..)
XPM_FILES    = $(VIVADO_VER_DIR_PATH)/data/ip/xpm/xpm_VCOMP.vhd
UNISIM_FILES = $(VIVADO_VER_DIR_PATH)/data/vhdl/src/unisims/unisim_VCOMP.vhd \
               $(VIVADO_VER_DIR_PATH)/data/vhdl/src/unisims/unisim_VPKG.vhd
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
# DO NOT TOUCH
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


all:
	echo "${$(VIVADO_BAT_PATH)%/*}"
	@echo hi
	@echo $(VIVADO_BAT_PATH_ENV_VAR_NAME)
	@echo $(VIVADO_BAT_PATH)
	@echo aaaaaaaaaaaaaaaa$(VIVADO_VER_DIR_PATH)
	@echo UNISIM_FILES---$(UNISIM_FILES)
	@echo XPM_FILES---$(XPM_FILES)
	@echo $(origin VIVADO_BAT_PATH_ENV_VAR_NAME)
	@echo $(flavor VIVADO_BAT_PATH_ENV_VAR_NAME)
	@echo $(value $(VIVADO_BAT_PATH_ENV_VAR_NAME))