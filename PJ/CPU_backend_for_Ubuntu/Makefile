# for Ubuntu
all: main

main: toolkit.cpp make_memory.cpp run.cpp main_Simulator.cpp
	g++-11 -g -std=c++20 -o CPU toolkit.cpp make_memory.cpp run.cpp main_Simulator.cpp

clean:
	rm CPU

.PHONY: all clean
