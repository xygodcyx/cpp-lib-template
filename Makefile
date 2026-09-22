# ==================== Configuration ====================
LIB_NAME 		  := mylib
BUILD_DIR_DEBUG   := build/debug
BUILD_DIR_RELEASE := build/release

JOBS := $(shell nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 4)

.DEFAULT_GOAL := debug

.PHONY: debug release config run install_debug install_release clean rebuild help

# ==================== Build Targets ====================

# Configure Debug only (no build)
config:
	cmake --preset debug

# Debug build
debug:
	cmake --preset debug
	cmake --build --preset debug -j$(JOBS)
	ln -sfn $(BUILD_DIR_DEBUG)/compile_commands.json compile_commands.json

# Release build
release:
	cmake --preset release
	cmake --build --preset release -j$(JOBS)
	ln -sfn $(BUILD_DIR_RELEASE)/compile_commands.json compile_commands.json

# Install Debug
install_debug:
	cmake --preset debug
	cmake --build --preset debug -j$(JOBS)
	cmake --install $(BUILD_DIR_DEBUG)
	ln -sfn $(BUILD_DIR_DEBUG)/compile_commands.json compile_commands.json

# Install Release
install_release:
	cmake --preset release
	cmake --build --preset release -j$(JOBS)
	cmake --install $(BUILD_DIR_RELEASE)
	ln -sfn $(BUILD_DIR_RELEASE)/compile_commands.json compile_commands.json

# ==================== Helper Targets ====================

all : debug release install_debug install_release

clean:
	rm -rf build install bin compile_commands.json

rebuild: clean debug

help:
	@echo "Targets:"
	@echo "  debug           - Configure and build Debug (default)"
	@echo "  release         - Configure and build Release"
	@echo "  config          - Configure Debug only (no build)"
	@echo "  install_debug   - Build and install Debug"
	@echo "  install_release - Build and install Release"
	@echo "  run             - Build and run the Debug binary"
	@echo "  clean           - Remove all build artifacts"
	@echo "  rebuild         - Clean and build Debug"
