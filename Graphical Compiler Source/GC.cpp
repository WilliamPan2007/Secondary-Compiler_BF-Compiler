#include <bits/stdc++.h>
#include <windows.h>
using namespace std;

int main(int argc, char const *argv[]){
	string a;
	a=argv[1];
	/* code */
	string b="BFC.exe ";
	string c=b+ a.c_str();
//	cout<<b;
	system(c.c_str());
	getchar();
	return 0;
}
