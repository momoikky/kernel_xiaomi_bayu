
# Set Location
CL="/media/ikkynux/GAME/Kernel/tools"
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
	export PATH="${CL}/Clang-18.0.0/bin/aarch64-linux-:${PATH}"
	make -j$(nproc --all) O=out ARCH=arm64 vayu_defconfig
    	make -j$(nproc --all) ARCH=arm64 O=out \
    			  ARCH=arm64 \
    			  CC="ccache clang" \
         		  LLVM=1 \
                          CROSS_COMPILE=aarch64-linux-gnu- \
                          CROSS_COMPILE_COMPAT=arm-linux-gnueabi-
}
#end
function ended(){
    echo "============================="
    echo "===COMPILE KERNEL COMPLETE==="
    echo "============================="
    
}

# execute
clean
init
build_kernel
ended
