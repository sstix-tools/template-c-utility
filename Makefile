CC ?= gcc
CFLAGS ?= -O2 -Wall -Wextra -pedantic
PREFIX ?= /usr
DESTDIR ?=
BINDIR = $(PREFIX)/bin
DATADIR = $(PREFIX)/share

NAME = template-c-utility
SRCS = src/main.c
OBJS = $(SRCS:.c=.o)

all: $(NAME)

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(OBJS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

install: $(NAME)
	install -D -m 0755 $(NAME) $(DESTDIR)$(BINDIR)/$(NAME)
	install -D -m 0644 completion/_$(NAME) $(DESTDIR)$(DATADIR)/zsh/site-functions/_$(NAME)

clean:
	rm -f $(NAME) $(OBJS)

.PHONY: all install clean
