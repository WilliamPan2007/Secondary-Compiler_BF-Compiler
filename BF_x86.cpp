#include <stdio.h>
#include <windows.h>
#include <string>
using namespace std;

char program[10240], paper[10240];
int  ptr=5120, stack[10240], sp=0;

void run(){
	int size=0, pc=0;
	for(; program[size]!='\0'; ++size);
	for(; pc<size; ++pc){
		if(!sp && program[pc]==']'){
			printf("sp is zero.\n");
			break;
		}
		switch(program[pc]){
			case '+':++paper[ptr]; break;
			case '-':--paper[ptr]; break;
			case '[':stack[sp]=pc; ++sp; break;
			case ']':pc=paper[ptr]?stack[sp-1]:pc;sp-=(!paper[ptr]); break;
			case '>':++ptr; break;
			case '<':--ptr; break;
			case ',':scanf("%c", &paper[ptr]); break;
			case '.':printf("%c", paper[ptr]); break;
		}
		if(ptr>=10240 || ptr<0){
			printf("paper out of range.\n");
			break;
		}
		if(sp>=1024){
			printf("sp out of range.\n");
			break;
		}
	}
	printf("\n");
	return;
}

int main(int argc, char *p[]){
	string a;
	a=p[1];
	freopen(a.c_str(), "r", stdin);
	scanf("%s", program);
	int i=0;
	for(; i<1024; ++i) paper[i]='\0';
	run();
	system("echo.");
	printf("Done.");
	//system("echo Done.");
	//system("pause");
	return 0;
}
