echo "scale=0;`du $1 | awk '{print $1}'` / 55000 + 4" | bc
