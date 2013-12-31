# Note: run 'make -f dist/Makefile [tarball]' from the top level directory in
# order to build the tarball.

TARBALL:=cpp-skeleton.tar.gz

all: tarball

.PHONY: tarball
tarball: ${TARBALL}

${TARBALL}: Makefile src/main.cpp
	tar -acf ${TARBALL} $^

clean:
	rm -f ${TARBALL}

