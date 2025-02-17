#Author: Molly Corgan
#File Name: Makefile
#Modification Date: 2/17/25
#Purpose: practice writing Makefiles for a given project



# VARIABLES

#Compiler
CC = g++

#name of the final execution
TARGET = employee

#compile with all errors and warnings
CFLAGS = -c -Wall -Wextra


# TARGETS

#default target that builds execution
all: $(TARGET)

#linked all object files into the final execution
$(TARGET): main.o Employee.o Officer.o Supervisor.o
	$(CC) -o $(TARGET) main.o Employee.o Officer.o Supervisor.o

#compile main.cpp
main.o: main.cpp Employee.h Officer.h Supervisor.h
	$(CC) $(CFLAGS) main.cpp

#compile Employee.cpp
Employee.o: Employee.cpp Employee.h
	$(CC) $(CFLAGS) Employee.cpp

#compile Officer.cpp
Officer.o: Officer.cpp Officer.h Employee.h
	$(CC) $(CFLAGS) Officer.cpp

#compile Supervisor.cpp
Supervisor.o: Supervisor.cpp Supervisor.h Employee.h
	$(CC) $(CFLAGS) Supervisor.cpp


#remove compile object files and backups
clean:
	rm -f *.o *~ $(TARGET)
