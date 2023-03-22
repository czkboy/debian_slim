all:
	g++ -Wall -g -fPIC -c helloworld.cpp -o helloworld.o
	g++ -shared helloworld.o -o libhelloworld.so
	g++ -Wall -o main.o -c main.cpp
	g++ -o main main.o -L/root/git/gitsinet/shared/ -lhelloworld
mac:
	g++ -Wall -g -fPIC -c helloworld.cpp -o helloworld.o
	g++ -shared helloworld.o -o libhelloworld.so
	g++ -Wall -o main.o -c main.cpp
	g++ -o main main.o -L/root/git/gitsinet/shared/ -lhelloworld
	