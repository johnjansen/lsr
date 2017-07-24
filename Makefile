all: lsr ftp_lsr

lsr:
	crystal build src/lsr.cr --release --no-debug

ftp_lsr:
	crystal build src/ftp_lsr.cr --release --no-debug


prefix=/usr/local

install: lsr
	install -m 0755 lsr $(prefix)/bin
	install -m 0755 ftp_lsr $(prefix)/bin

.PHONY: install
