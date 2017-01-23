CC=g++
CFLAGS=-c
CPPUNIT_FLAGS=-I$CPPUNIT_HOME/include -L$CPPUNIT_HOME/lib -lcppunit
OFILE=program
TEST_SRC=test
TEST_OFILE=program_tests

all: $(OFILE)

test: $(TEST_OFILE)

$(OFILE): Helloer.o main.o
	$(CC) Helloer.o main.o -o $(OFILE)

$(TEST_OFILE): Helloer.o tests.o
	$(CC) Helloer.o tests.o $(CPPUNIT_FLAGS) -o $(TEST_OFILE)

Helloer.o: Helloer.cpp
	$(CC) $(CFLAGS) Helloer.cpp
	
main.o: main.cpp
	$(CC) $(CFLAGS) main.cpp

tests.o: $(TEST_SRC)/main.cpp
	$(CC) $(CFLAGS) $(TEST_SRC)/main.cpp -o tests.o

clean:
	rm -rf *.o $(OFILE) $(TEST_OFILE) Helloer.o main.o test.o