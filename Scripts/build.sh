#!/bin/bash

target=`cat ./Scripts/build.target`

./bin/DistributionTool.exe -b -i ./Sources/${target}.sdPlugin -o Release