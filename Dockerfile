FROM scratch
MAINTAINER Yung Hwa Kwon <yung.kwon@damncarousel.com>

COPY ./nop /
COPY ./etc/confd /etc/confd

# /nop does nothing but allows us to call an executable
CMD [ "/nop" ]
