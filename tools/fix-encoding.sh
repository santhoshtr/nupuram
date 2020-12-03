for file in *.svg
do
    if [ $(file -i "$file" | grep -c 16le )  -eq 1 ]
    then
        iconv -c -f utf-16 -t utf8 -o "$file.new" "$file"
        mv -f "$file.new" "$file"
        sed -i -e 's/UTF-16/UTF-8/g' "$file"
    fi
done

