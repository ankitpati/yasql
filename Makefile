INSTALL ?= install
SHELL ?= bash
PERL ?= $(shell which perl)
PREFIX ?= /usr/local
bindir = ${PREFIX}/bin
mandir = ${PREFIX}/man
sysconfdir = ${PREFIX}/etc

yasql yasql.1 : YASQL-VERSION-FILE
	${PERL} ./config.pl ${PERL} ${bindir} ${mandir} \
		${sysconfdir} "${YASQL_VERSION}"

YASQL-VERSION-FILE:
	${SHELL} ./YASQL-VERSION-GEN
-include YASQL-VERSION-FILE

default: yasql yasql.1

install: default
	${PERL} ./install.pl ${INSTALL} "${bindir}" "${mandir}" "${sysconfdir}"

check: default
	./yasql --help > /dev/null

clean:
	rm -f yasql yasql.1 YASQL-VERSION-FILE
