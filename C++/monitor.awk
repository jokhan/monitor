#!/bin/awk
BEGIN{ num=33
	name="main"
	print num,name
}
{
	if( /^[\s ]*using[\s ]*namespace/ ) {
		printf( "int %sInfos[%d];\n",name,NR)
		print $0
	} else {
	}
}
END {
}
