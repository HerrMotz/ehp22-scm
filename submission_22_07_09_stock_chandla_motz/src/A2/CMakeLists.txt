cmake_minimum_required(VERSION 3.16)
project(ehp22_scm)

set(CMAKE_CXX_STANDARD 14)

enable_language(C ASM)

add_executable(9_2
        add_asm.s
        add_c.c
        driver.cpp)
