# init cpp

[![CMake build and test](https://github.com/dk949/cpp-init/actions/workflows/cmake-multi-platform.yml/badge.svg)](https://github.com/dk949/cpp-init/actions/workflows/cmake-multi-platform.yml)

<!-- CPP_INIT_DESC_START -->
cmake boilerplate for a C++ project. Originally a fork of [cpp starter
project](https://github.com/lefticus/cpp_starter_project).

> [!NOTE]
> This project is meant specifically for C++, it will likely take a lot
> of work to adapt it for use with C (or any other language).

> [!NOTE]
> The minimum required standard is C++17 (default since GCC 11 and Clang 16).
<!-- CPP_INIT_DESC_END -->

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

<!-- CPP_INIT_SETUP_START -->
The project is setup as a template and needs to be setup before it can be used:

```sh
./setup.sh
```

Run `setup.sh -h` for more options
<!-- CPP_INIT_SETUP_END -->

### Configure cmake

```sh
cmake --preset default
```

### Build the default target

```sh
cmake --build build
```

### Build the release target

```sh
cmake --build build --config Release
```

### Testing

Tests are enabled by default in debug mode and disabled by default in release.
They can be explicitly controlled with `-D<PROJECT_NAME>_BUILD_TESTING`.

```sh
./build/bin/<project_name>_test
```

### Coverage

This command will build (if not built) and run the tests then print a coverage
report.

Coverage uses `lcov`. If `lcov` is not installed it tries to use `nix` to run
`lcov`. If neither is found an error is thrown. Disable coverage  with
`-D<PROJECT_NAME>_ENABLE_COVERAGE=NO` (off by default in release mode).

```
cmake --build build -t coverage_<project_name>_test
```
