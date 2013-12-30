PROGNAME:=cpp-skeleton
SRC:=$(shell find src/ -name '*.cpp')
TMPOBJS:=${SRC:.cpp=.o}
OBJS:=$(foreach TMP,${TMPOBJS},$(subst src/,obj/,$(TMP)))
DEPS:=${OBJS:.o=.d}
INCLUDES:=$(foreach TMP,src/,-I${TMP})
CXXFLAGS:=-std=c++0x ${INCLUDES}

vpath %.cpp src/
vpath %.hpp src/
vpath %.d obj/

all: ${PROGNAME}

-include ${DEPS}

${PROGNAME}: ${OBJS}
	${CXX} ${LDFLAGS} $^ -o $@

obj/%.o: %.cpp
	@mkdir -p $(dir $@)
	${CXX} ${CXXFLAGS} -MMD -MP -c $< -o $@

.PHONY: clean
clean:
	rm -rf obj/ ${PROGNAME}

