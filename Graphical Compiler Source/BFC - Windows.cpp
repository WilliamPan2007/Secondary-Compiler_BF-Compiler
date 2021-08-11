#include <iostream>
#include <cstring>
#include <string>
#include <cstdio>
#include <stack>
#include <list>
#include <windows.h>

std::string ProgramLine, ProgramFile;
struct node {
	unsigned char _Val[1024];
	node() { memset(_Val, 0x0, sizeof(_Val)); }
} _Node;
std::list < node > L;
std::stack < int > Stk;
unsigned char *_Ptr;
int _cnt;

inline int Check()
{
	std::stack < int > st;
	int _Len = ProgramFile.length();
	for (int i = 0; i < _Len; ++i)
	{
		if (ProgramFile[i] == '[')
			st.push(i);
		else if (ProgramFile[i] == ']')
		{
			if (st.empty())
				return i + 1;
			else st.pop();
		}
	}
	if (st.empty())
		return 0;
	else
		return st.top() + 1;
}

inline void Work()
{
	int _Len = ProgramFile.length();
	int Res = Check();
	if (Res)
	{
		std::cerr << "Syntax Error: At column " << Res << std::endl;
		std::cerr << std::endl;
		for (int i = std::max(Res - 5, 0); i < std::min(_Len, Res + 5); i++)
			std::cerr << ProgramFile[i];
		std::cerr << std::endl;
		for (int i = 0; i < std::min(4, Res - 1); ++i)
			std::cerr << ' ';
		std::cerr << '^' << std::endl;
		return;
	}
	L.push_back(_Node);
	std::list < node >::iterator it = L.begin();
	_Ptr = it->_Val;
	for (int i = 0; i < _Len; i++)
	{
		switch (ProgramFile[i])
		{
		case '+': *_Ptr += 1; break;
		case '-': *_Ptr -= 1; break;
		case '[': Stk.push(i); break;
		case ']':
			if (*_Ptr)
				i = Stk.top();
			else
				Stk.pop();
			break;
		case '>':
			if (_cnt < 1023)
				_Ptr += 1, _cnt += 1;
			else
			{
				_cnt = 0;
				if (it == L.end())
					L.push_back(_Node);
				it++;
				_Ptr = it->_Val;
			}
			break;
		case '<':
			if (_cnt)
				_Ptr -= 1, _cnt -= 1;
			else
			{
				_cnt = 1023;
				if (it == L.begin())
					L.push_front(_Node);
				it--;
				_Ptr = it->_Val + 1023;
			}
			break;
		case ',': *_Ptr = getchar(); break;
		case '.': putchar(*_Ptr); break;
		default: break;
		}
	}
	return;
}

int main(int argc, const char **argv)
{
	freopen(argv[1], "r", stdin);
	std::ios::sync_with_stdio(false);
	
	while (std::getline(std::cin, ProgramLine))
		ProgramFile += ProgramLine;
	fclose(stdin);
	
//	freopen(argv[2], "w", stdout);
	Work();
//	fclose(stdout);
//	printf("\nDone.\n");
//	system("pause");
	return 0;
}
