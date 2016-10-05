#!/bin/sh
lines=`wc -l $1 | awk 'num=$1 {print num}'`
name=`basename $1 .cpp`
# echo $lines
echo "#!/bin/awk" > $2
echo "BEGIN{ num=$lines" >> $2
echo "\tname=\"$name\"" >> $2
echo "\tprint num,name" >> $2
echo "}" >> $2

echo "{" >> $2
echo "\tif( /^[\s ]*using[\s ]*namespace/ ) {" >> $2
echo "\t\tprintf( \"%s\\\\nint %sInfos[%d];\",\$0,name,NR)" >> $2
echo "\t} else {" >> $2
echo "\t}" >> $2
echo "}" >> $2

echo "END {" >> $2
echo "}" >> $2
