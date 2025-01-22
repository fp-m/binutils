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
	install -d $(HOME)/.local/lib/fpm/arm
	install build/ld/ld-new $(HOME)/.local/lib/fpm/arm/ld
	ln -s -f ld $(HOME)/.local/lib/fpm/arm/collect2

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
