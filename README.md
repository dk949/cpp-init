# init cpp

cmake boilerplate for a c++ project. Originally a fork of [cpp starter
project](https://github.com/lefticus/cpp_starter_project).

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
./vcpkg/bootstrap-vcpkg.sh # -disableMetrics
./vcpkg/vcpkg install

cmake -B build

cmake --build build

./build/bin/cpp_init
```
