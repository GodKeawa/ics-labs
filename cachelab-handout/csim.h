#pragma once

#define MININT -2147483648

// cache parameters
int numSet;
int associativity;
int blockSize;
char filePath[100];
int verbose = 0;

// final results
int hits = 0;
int misses = 0;
int evictions = 0;

// will be set in getopt() function
extern char *optarg;

// you can define functions here
void usage();
void parseline(int argc, char **argv);
void cache_init();
void cache_free();
void update_time(int s, int index);
void update_all(int s, int tag);
void try_eviction(int s, int tag);
void get_trace();
void Simulate();