current_date=$(date +%Y-%m-%d)
start=$(date -d $1 +%s)
end=$(date -d $current_date +%s)
weekdiff=$(((end-start) / 60 / 60 / 24 / 7))

echo "Start date: $start"
echo "End date: $end"
echo "Week difference: $weekdiff"

weekindex=$((weekdiff % 2))
echo $weekindex