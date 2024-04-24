#!/bin/bash
current_date=$(date +%Y-%m-%d)
start=$(date -d $1 +%s)
end=$(date -d $current_date +%s)
weekdiff=$(((end-start) / 60 / 60 / 24 / 7))
weekindex=$((weekdiff % 2))
echo $weekindex