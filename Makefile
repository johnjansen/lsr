all: lsr ftp_lsr

lsr:
	crystal build src/lsr.cr --release --no-debug

ftp_lsr:
	crystal build src/ftp_lsr.cr --release --no-debug
