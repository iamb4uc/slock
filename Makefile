# doomlock - simple screen locker
# See LICENSE file for copyright and license details.

include config.mk

SRC = doomlock.c ${COMPATSRC}
OBJ = ${SRC:.c=.o}

all: options doomlock

options:
	@echo doomlock build options:
	@echo "CFLAGS   = ${CFLAGS}"
	@echo "LDFLAGS  = ${LDFLAGS}"
	@echo "CC       = ${CC}"

.c.o:
	@echo CC $<
	@${CC} -c ${CFLAGS} $<

${OBJ}: config.h config.mk arg.h util.h

config.h:
	@echo creating $@ from config.def.h
	@cp config.def.h $@

doomlock: ${OBJ}
	@echo CC -o $@
	@${CC} -o $@ ${OBJ} ${LDFLAGS}

clean:
	@echo cleaning
	@rm -f doomlock ${OBJ} doomlock-${VERSION}.tar.gz

dist: clean
	@echo creating dist tarball
	@mkdir -p doomlock-${VERSION}
	@cp -R LICENSE Makefile README.md doomlock.1 config.mk \
		${SRC} explicit_bzero.c arg.h util.h doomlock-${VERSION}
	@tar -cf doomlock-${VERSION}.tar doomlock-${VERSION}
	@gzip doomlock-${VERSION}.tar
	@rm -rf doomlock-${VERSION}

install: all
	@echo installing executable file to ${DESTDIR}${PREFIX}/bin
	@mkdir -p ${DESTDIR}${PREFIX}/bin
	@cp -f doomlock ${DESTDIR}${PREFIX}/bin
	@chmod 755 ${DESTDIR}${PREFIX}/bin/doomlock
	@chmod u+s ${DESTDIR}${PREFIX}/bin/doomlock
	@echo installing manual page to ${DESTDIR}${MANPREFIX}/man1
	@mkdir -p ${DESTDIR}${MANPREFIX}/man1
	@sed "s/VERSION/${VERSION}/g" <doomlock.1 >${DESTDIR}${MANPREFIX}/man1/doomlock.1
	@chmod 644 ${DESTDIR}${MANPREFIX}/man1/doomlock.1

uninstall:
	@echo removing executable file from ${DESTDIR}${PREFIX}/bin
	@rm -f ${DESTDIR}${PREFIX}/bin/doomlock
	@echo removing manual page from ${DESTDIR}${MANPREFIX}/man1
	@rm -f ${DESTDIR}${MANPREFIX}/man1/doomlock.1

.PHONY: all options clean dist install uninstall
