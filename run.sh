#!/bin/bash

./bellman cuda input/USA-road-d.NY.gr 196 1024 0 - Runs cuda implementation version 1
./bellman cuda-stride input/USA-road-d.NY.gr 196 1024 0 - Runs cuda implementation version 2
./bellman cuda-v3 input/USA-road-d.NY.gr 196 1024 0 - Runs cuda implementation version 3