#!/bin/sh
lines=`wc -l $1 | awk 'num=$1 {print num}'`
name=`basename $1 .cpp`
awk_file="monitor.awk"
cpp_file="${name}_monitor.cpp"
# echo $lines

## create monitor.awk
echo "creating ${awk_file}"
### TITLE
echo "#!/bin/awk -f" > ${awk_file}
### BEGIN
echo "BEGIN{ num=$lines" >> ${awk_file}
echo "\tname=\"$name\"" >> ${awk_file}
#echo "\tprint num,name" >> ${awk_file}
echo "}" >> ${awk_file}

### BODY
echo "{" >> ${awk_file}
echo "\tif( /^[\\\\t ]*using[\\\\t ]*namespace/ ) {" >> ${awk_file}
echo "\t\tprintf \"%s\\\\nunsigned int %sInfos[%d] = {0};\\\\n\",\$0,name,num" >> ${awk_file}
echo "\t\tprint \"void printInfos();\"" >> ${awk_file}
echo "\t}" >> ${awk_file}
echo "\telse if( (!(/^[\\\\t ]*(\/[\/\*])/)) && (/;[\\\\t ]*(\/[\/\*])?/) ) {" >> ${awk_file}
echo "\t\tprintf \"++ %sInfos[%d];\\\\t%s\\\\n\",name, NR, \$0" >> ${awk_file}
echo "\t} else {" >> ${awk_file}
echo "\t\tprint \$0" >> ${awk_file}
echo "\t}" >> ${awk_file}
echo "}" >> ${awk_file}

### END
echo "END {" >> ${awk_file}
echo "print \"void printInfos()\"" >> ${awk_file}
echo "print \"{\"" >> ${awk_file}
echo "print \"\\\tcout << \\\"line\\\" << \\\"\\\\tcount\\\" << endl;\"" >> ${awk_file}
echo "printf \"\\\tfor( int i = 0; i < %d; ++ i )\\\n\", NR" >> ${awk_file}
echo "printf \"\\\t\\\tcout << i << \\\"\\\\t\\\" << %sInfos[i] << endl;\\\\n\",name" >> ${awk_file}
echo "print \"}\"" >> ${awk_file}
echo "}" >> ${awk_file}
## create monitor.awk end
echo "${awk_file} is created"

## create monitor.cpp
echo "creating ${cpp_file}"
awk -f ${awk_file} $1 > ${cpp_file}
## create monitor.cpp end
echo "${cpp_file} is created"

