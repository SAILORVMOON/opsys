cat /etc/group | grep "$1" > $2
cat "$PWD/$2" | cut -d ":" -f 4 > $3
cat "$PWD/$2" | cut -d ":" -f 1 > $4
IFS=,
z=$(<"$PWD/$3")
k=$(cat "$PWD/$2" | wc -l)
for (( i=1; i<=$k; i++ )) do
    a=$(cat "$PWD/$3" | sed "$i!d")
    for j in $a; do
        if [ $j = $1 ]; then
            echo $(cat "$PWD/$4" | sed "$i!d")
        fi
    done

done

