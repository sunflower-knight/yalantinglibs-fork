#!/bin/bash
set -e

function generate() {
    ROOT_DIR=$(pwd)
    cd "$ROOT_DIR" || exit 1

    # delete website's static dir generated before
    rm -r dist
    mkdir dist

    # Commands without errors : copy images from english to chinese dir
    set +e # Disable -e option temporarily
    cp -r docs/coro_rpc/images docs/zh/coro_rpc
    cp -r docs/guide/images docs/zh/guide
    cp -r docs/struct_pack/images docs/zh/struct_pack
    cp -r docs/struct_pb/images docs/zh/struct_pb
    set -e # Re-enable -e option

    # generate
    yarn docs:build
    doxygen Doxyfile
    doxygen Doxyfile_cn
    echo 'Generate Done!'
}


