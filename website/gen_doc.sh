set -e

ROOT_DIR=$(pwd)
cd "$ROOT_DIR" || exit 1

yarn docs:build
doxygen Doxyfile
doxygen Doxyfile_cn
echo 'Generate Done!'
