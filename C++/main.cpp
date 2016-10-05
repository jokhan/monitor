/*
 * author: jokhan
 * date: 2016年 10月 04日 星期二 19:27:25 CST
 * function: main.cpp
 */
#include <iostream>
#include <map>

using namespace std;

//#define LINENUMS 25
//unsigned int infos[LINENUMS] = {0};

void printInfos( );

int main()
{       
	int num = 1;
	for( int i = 0; i < 10; ++ i ) {
	}
	printInfos();
	return 0;
}


void printInfos( )
{
	cout << "NO\tCount" << endl;
	for( int i = 0; i < LINENUMS; ++i ) {
		cout << i + 1 << "\t" << infos[i] << endl;
	}
	cout << endl;
}
