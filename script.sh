mkdir -p ./analyzed 
find . -maxdepth 1 -mindepth 1 -regextype posix-extended -regex '^.*\.[jJ][pP]([eE])?[gG]' -printf '%f\n' | while read i; do
b="$(magick "${i}" -statistic StandardDeviation 5X5 -format "%[fx:maxima]\n" info: | awk -F'.' '{print $2}' | cut -c 1-4)"
echo "Copying ${i} to ./analyzed/${b}_${i}"
cp -p ./${i} ./analyzed/${b}_${i}
done
