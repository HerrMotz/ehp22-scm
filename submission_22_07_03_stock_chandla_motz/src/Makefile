BUILD_DIR = ./build

BUILD_OPTIONS=-Wall -Winfloop -g2012
TOOL=iverilog

# counter_mod_k_count
SRC_COUNTER_MOD_K_COUNT=counter_mod_k_count.sv
SRC_COUNTER_MOD_K_COUNT_TB=counter_mod_k_count_tb.sv ${SRC_COUNTER_MOD_K_COUNT}

counter_mod_k_count_tb: ${SRC_COUNTER_MOD_K_COUNT_TB}
	${TOOL} ${BUILD_OPTIONS} -o ${BUILD_DIR}/counter_mod_k_count_tb ${SRC_COUNTER_MOD_K_COUNT_TB}

# counter_mod_k_ro
SRC_COUNTER_MOD_K_RO=counter_mod_k_ro.sv
SRC_COUNTER_MOD_K_RO_TB=counter_mod_k_ro_tb.sv ${SRC_COUNTER_MOD_K_RO}

counter_mod_k_ro_tb: ${SRC_COUNTER_MOD_K_RO_TB}
	${TOOL} ${BUILD_OPTIONS} -o ${BUILD_DIR}/counter_mod_k_ro_tb ${SRC_COUNTER_MOD_K_RO_TB}

# clock
SRC_CLOCK=clock.sv
SRC_CLOCK_TB=clock_tb.sv ${SRC_CLOCK}

clock_tb: ${SRC_CLOCK_TB}
	${TOOL} ${BUILD_OPTIONS} -o ${BUILD_DIR}/clock_tb ${SRC_CLOCK_TB}

# clocks de10 lite
SRC_CLOCKS_DE10_LITE=clocks_de10_lite.sv ${SRC_COUNTER_MOD_K_RO} ${SRC_CLOCK}

clocks_de10_lite: ${SRC_CLOCKS_DE10_LITE}
	${TOOL} ${BUILD_OPTIONS} -o ${BUILD_DIR}/clocks_de10_lite ${SRC_CLOCKS_DE10_LITE}

all: counter_mod_k_count_tb counter_mod_k_ro_tb clock_tb clocks_de10_lite

$(shell mkdir -p build)
