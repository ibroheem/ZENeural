all: test

build:
	-mkdir ./build
	g++ -c ./library/*.cpp -o ./build/zeneural.o
	ar rcs ./build/zeneural.a ./build/zeneural.o 

install: build
	sudo cp ./build/zeneural.a /usr/local/lib
	sudo mkdir /usr/local/lib/zeneural
	sudo cp -r ./library/header/* /usr/local/lib/zeneural/

uninstall:
	@-sudo rm -r /usr/local/lib/zeneural
	@-sudo rm /usr/local/lib/zeneural.a

clean:

	@-rm -r ./build
	@-rm ./test

test: 
	g++ -O0 ./library/*.cpp -o test
	./test

debug:
	g++ ./library/*.cpp -o test -g
	gdb ./test
