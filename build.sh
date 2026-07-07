#!/bin/sh
set -e

ROOT_DIR="$1"
MODE="$2"

MODULE_NAME="$(basename "$(pwd)")"

if [ -z "$ROOT_DIR" ] || [ -z "$MODE" ]; then
    echo "Usage: build.sh <root_dir> <release|debug>"
    exit 1
fi


echo "Building $MODULE_NAME ($MODE)"


# Building the Rust library
if [ "$MODE" = "release" ]; then
    cargo build --release
    TARGET_DIR="target/release"
else
    cargo build
    TARGET_DIR="target/debug"
fi


# Assignments folder
OUT_DIR="$ROOT_DIR/uvmodules/$MODULE_NAME"

mkdir -p "$OUT_DIR"


# Copy dll/so/dylib
echo "Copying library artifacts..."

case "$(uname -s)" in
    Linux*)
        cp "$TARGET_DIR"/*.so "$OUT_DIR/" 2>/dev/null || true
        ;;
    Darwin*)
        cp "$TARGET_DIR"/*.dylib "$OUT_DIR/" 2>/dev/null || true
        ;;
    MINGW*|MSYS*|CYGWIN*|Windows_NT)
        cp "$TARGET_DIR"/*.dll "$OUT_DIR/" 2>/dev/null || true
        ;;
esac


# Copy ultraviolet
if [ -d "ultraviolet" ]; then
    echo "Copying ultraviolet..."

    cp -r ultraviolet/* "$OUT_DIR/"
fi


echo "Done: $OUT_DIR"