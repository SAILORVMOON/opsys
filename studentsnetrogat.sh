IFS="]"
cat "$PWD/students" | cut -d " " -f 2- > "$PWD/a"

k=$(cat "$PWD/a" | wc -l)
one=1
allsum=0
for (( i=1; i<=$k; i++ )) do
    a=$(cat "$PWD/a" | sed "$i!d")
    IFS=" "
    summ=0
    cou=0
    for j in $a; do
        summ=$(bc <<< "$summ+$j")
        cou=$(bc <<< "$cou+$one")
    done
    summ=$(bc <<< "scale=1;$summ/$cou")
    allsum=$(bc <<< "scale=1;$summ+$allsum")
    a=$(cat "$PWD/students" | sed "$i!d")
    echo $a "|" $summ
done
allsum=$(bc <<< "scale=1;$allsum/$k")
echo $allsum
