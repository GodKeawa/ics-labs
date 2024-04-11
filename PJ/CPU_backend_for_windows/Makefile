# for Windows no frontend
all: main

main: toolkit.cpp make_memory.cpp run.cpp main_Simulator.cpp
	g++ -g -std=c++2a -o CPU toolkit.cpp make_memory.cpp run.cpp main_Simulator.cpp

clean:
	del *.o CPU.exe -rf

.PHONY: all clean



