PROGNAME:=cpp-skeleton
SRC:=$(shell find src/ -name '*.cpp')
TMPOBJS:=${SRC:.cpp=.o}
OBJS:=$(foreach TMP,${TMPOBJS},$(subst src/,obj/,$(TMP)))
DEPS:=$(shell find obj/ -name '*.d')
INCLUDES:=$(foreach TMP,src/,-I${TMP})
CXXFLAGS:=-std=c++0x ${INCLUDES}

vpath %.cpp src/
vpath %.hpp src/
vpath %.d obj/

-include ${DEPS}

all: ${PROGNAME}

${PROGNAME}: ${OBJS}
	${CXX} ${LDFLAGS} $^ -o $@

obj/%.o: %.cpp
	${CXX} ${CXXFLAGS} -MMD -MP -c $^ -o $@

.PHONY: clean
clean:
	rm -rf obj/ ${PROGNAME}

