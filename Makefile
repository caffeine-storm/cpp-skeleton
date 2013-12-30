PROGNAME:=cpp-skeleton
SRC:=$(shell find src/ -name '*.cpp')
TMPOBJS:=${SRC:.cpp=.o}
OBJS:=$(foreach TMP,${TMPOBJS},$(subst src/,obj/,$(TMP)))
INCLUDES:=$(foreach TMP,src/,-I${TMP})
CXXFLAGS:=-std=c++0x ${INCLUDES}

vpath %.cpp src/
vpath %.hpp src/

all: ${PROGNAME}

${PROGNAME}: ${OBJS}
	${CXX} ${LDFLAGS} $^ -o $@

obj/%.o: %.cpp
	mkdir -p `dirname $@`
	${CXX} ${CXXFLAGS} -c $^ -o $@

.PHONY: clean
clean:
	rm -rf obj/ ${PROGNAME}

