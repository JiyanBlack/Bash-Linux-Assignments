#include  <stdio.h>
#include  <stdbool.h>
#include  <stdlib.h>

// calcmarks, version 1, released Thu Sep 15 14:26:09 WST 2016

// DECLARE GLOBAL PREPROCESSOR CONSTANTS
#define  MAXMARKS  200

// DECLARE GLOBAL FUNCTIONS
extern int         readmarks(FILE *); // parameter is not named
extern void        correlation(int);  // parameter is not named

// DECLARE GLOBAL VARIABLES
extern	double     projmarks[];       // array size is not provided
extern	double     exammarks[];
extern	bool       verbose;
