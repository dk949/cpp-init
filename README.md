# init cpp

cmake boilerplate for a C++ project. Originally a fork of [cpp starter
project](https://github.com/lefticus/cpp_starter_project).

_NOTE 1:_ This project is meant specifically for C++, it will likely take a lot of
work to adapt it for use with C (or any other language).

_NOTE 2:_ The minimum recommended standard is C++17 (default since GCC 11 and
Clang 16). The minimum supported standard is C++11 (though this only matters for
certain warnings).

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

```sh
git clone "https://github.com/Microsoft/vcpkg.git"
./vcpkg/bootstrap-vcpkg.sh -disableMetrics
./vcpkg/vcpkg install

cmake -B build

cmake --build build

# run the executable
./build/bin/cpp_init

# run the tests
./build/bin/cpp_init_test
#or
ctest --test-dir build/tests
```
