DATA_DIR="data"
total=0      
max_count=-1     
max_file=""      

update_max() {
    if (( $2 > max_count )); then
        max_count=$2
        max_file=$1
    fi
}

for f in "$DATA_DIR"/*.log ; do
    count=$(grep -c "ERROR" "$f")
    total=$((total + count))
    update_max "$f" "$count"
    printf "%-14s %5d\n" "$f" "$count"
done

echo "-------------------------"
echo "Всего строк ERROR: $total"
echo "Больше всего ошибок: $max_file ($max_count)"