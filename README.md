# init cpp

[![CMake build and test](https://github.com/dk949/cpp-init/actions/workflows/cmake-multi-platform.yml/badge.svg)](https://github.com/dk949/cpp-init/actions/workflows/cmake-multi-platform.yml)

cmake boilerplate for a C++ project. Originally a fork of [cpp starter
project](https://github.com/lefticus/cpp_starter_project).

_NOTE 1:_ This project is meant specifically for C++, it will likely take a lot of
work to adapt it for use with C (or any other language).

_NOTE 2:_ The minimum required standard is C++17 (default since GCC 11 and Clang 16).

## Dependencies

### Required

* A C++ compiler
* [cmake](https://cmake.org/)

### Optional

* [ccache](https://ccache.dev/)
* [clang-format](https://clang.llvm.org/docs/ClangFormat.html)
* [clang-tidy](https://clang.llvm.org/extra/clang-tidy/)
* [cmake-format](https://github.com/cheshirekow/cmake_format)
* [cppcheck](http://cppcheck.sourceforge.net/)
* [dot](https://graphviz.org/)
* [doxygen](https://www.doxygen.nl/index.html)

## Usage

Run the following commands to get started, more info available in the
[wiki](https://github.com/dk949/cpp-init/wiki).

### Configure vcpkg

```sh
git clone "https://github.com/Microsoft/vcpkg.git"
./vcpkg/bootstrap-vcpkg.sh -disableMetrics
./vcpkg/vcpkg install
```

### Configure cmake

```sh
cmake --preset make # Check `cmake --list-presets` for other preset options
```

### Build the default target

```sh
cmake --build build
```

### Testing

Tests are enabled by default in debug mode and disabled by default in release.
They can be explicitly controlled with `-DBUILD_TESTING`.

```
./build/bin/cpp_init_test
#or
ctest --test-dir build/tests
```

### Coverage

This command will build (if not built) and run the tests then print a coverage
report.

Coverage uses `lcov`. If `lcov` is not installed it tries to use `nix` to run
`lcov`. If neither is found an error is thrown. Disable coverage  with
`-DENABLE_COVERAGE=NO` (off by default in release mode).

```
cmake --build build -t coverage
```
