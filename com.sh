# ANSI color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'
CYAN='\033[0;36m'

# Set Location
CL="/media/IkkyMomo/GAME/Kernel/tools"
WORK_DIR=$(pwd)
KERN_IMG="${WORK_DIR}/out/arch/arm64/boot/dtb"
KERN_IMG2="${WORK_DIR}/out/arch/arm64/boot/Image.gz"

function clean() {
    echo "================="
    echo "===CLEANING UP==="
    echo "================="
    rm -rf out
}

# init
function init() {
    echo "============================"
    echo "===START COMPILING KERNEL==="
    echo "============================"
}

# Main
function build_kernel() {
    export ARCH=arm64
    export SUBARCH=arm64
    export PATH="${CL}/18.0.0-r510928/bin:${PATH}"
    make -j$(nproc --all) O=out ARCH=arm64 vayu_defconfig
    make -j$(nproc --all) ARCH=arm64 O=out \
        ARCH=arm64 \
        CC="ccache clang" \
        LLVM=1 \
        CROSS_COMPILE=aarch64-linux-gnu- \
        CROSS_COMPILE_COMPAT=arm-linux-gnueabi-
}


# execute
clean
init
build_kernel

# Check if either KERN_IMG2 or KERN_IMG is equal to 0
if [ "${KERN_IMG}" -eq 1 ]; then
    echo -e "${CYAN}=============================${NC}"
    echo -e "${GREEN}===COMPILE KERNEL COMPLETE===${NC}"
    echo -e "${CYAN}=============================${NC}"
    exit 1
else
    echo -e "${CYAN}=============================${NC}"
    echo -e "${RED}=== COMPILE KERNEL FAILED ===${NC}"
    echo -e "${CYAN}=============================${NC}"
    exit 0
fi
