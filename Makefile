.PHONY: all clean
	
# -ftemplate-depth-1024 -ftemplate-backtrace-limit=0
override CXXFLAGS += -std=c++1z -Wno-gnu-string-literal-operator-template -O3

override TARGETS := math regexp test number test2

all: $(TARGETS)
	
math: math.o 
	$(CXX) $(CXXFLAGS) $< -o $@
	
regexp: regexp.o 
	$(CXX) $(CXXFLAGS) $< -o $@
	
test: test.o
	$(CXX) $(CXXFLAGS) $< -o $@
	
test2: test2.o
	$(CXX) $(CXXFLAGS) $< -o $@
	
number: number.o
	$(CXX) $(CXXFLAGS) $< -o $@

%.o: %.cpp static-parser.hpp static-stack.hpp static-decider.hpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f *.o $(TARGETS)