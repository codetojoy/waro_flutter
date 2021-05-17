#!/bin/bash

set -e

find lib -name "*.dart" -exec flutter format {} \; 
