VPATH = src:headers
CXXFLAGS=-Iheaders -O2 -Wall -Wextra -Weffc++ -Wconversion -Wshadow -Wcast-align -Wwrite-strings -Wstrict-overflow=5  -Wpointer-arith -Winit-self  
HEADERS=ewah.h ewahutil.h boolarray.h runninglengthword.h

all: unit unit32bits example

unit32bits: $(HEADERS) unit.cpp
	$(CXX) $(CXXFLAGS) -m32 -o unit32bits src/unit.cpp 
	
unit: $(HEADERS) unit.cpp 
	$(CXX) $(CXXFLAGS) -o unit src/unit.cpp 
		
example: $(HEADERS) example.cpp
	$(CXX) $(CXXFLAGS) -o example example.cpp

cppcheck: 
	cppcheck --enable=all headers/*.h src/*.cpp *.cpp


doxygen: 
	doxygen doxyconfig.txt

package: 
	zip -9 EWAHBoolArray_`date +%Y-%m-%d`.zip README CHANGELOG makefile example.cpp headers/*.h src/*.cpp
	cd ..;zip -9 ./EWAHBoolArray/EWAHBoolArray.0.1.0-src.zip ./EWAHBoolArray/README ./EWAHBoolArray/CHANGELOG ./EWAHBoolArray/makefile ./EWAHBoolArray/example.cpp ./EWAHBoolArray/headers/*.h ./EWAHBoolArray/src/*.cpp
clean: 
	rm -f *.o unit example unit32bits
