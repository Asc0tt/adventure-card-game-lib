#!/bin/bash 

# https://pub.dev/packages/test_coverage

# need add dev_dependency in pubspec.yaml...
# dev_dependencies:
#  test_coverage: ^0.4.2
# then run command...
# dart pub get
# place this file to root directory of dart project
# execute in terminal...
# chmod +x ./tests-run.sh
# for run this script execute in terminal...
# ./tests-run.sh

# run unit tests
dart run test -r json .

# run unit test coverage package
dart pub run test_coverage

# build report
genhtml -o coverage coverage/lcov.info

# open report
open coverage/index.html
