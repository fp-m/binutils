#
# make
# make all      -- build everything
#
# make install  -- install binaries to /usr/local
#
# make clean    -- remove build files
#

all:    build
	$(MAKE) -C build $@

install: build/ld/ld-new
	install build/ld/ld-new /usr/local/bin/arm-fpm-ld

clean:
	rm -rf build

build:
	mkdir $@
	(cd $@ && ../configure \
            --target=arm-elf \
            --prefix=/usr/local/arm-fpm \
            --disable-nls \
            --disable-binutils \
            --disable-gdb \
            --disable-gold \
            --disable-gas \
            --disable-readline \
            --disable-sim \
            --disable-zlib \
            --disable-gprof \
            --disable-gprofng \
        )

build/ld/ld-new: build
	$(MAKE) -C build $@
