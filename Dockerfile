FROM perl:5.24-slim-threaded
LABEL version="1.0" maintainer="JJ Merelo <jjmerelo@GMail.com>" perl5version="5.24"

# Set up dir and download modules
RUN chmod o+r /etc/resolv.conf
RUN mkdir /test && apt-get update && apt-get install -y git curl libio-socket-ssl-perl libnet-ssleay-perl
RUN perl --version

# Will run this
ENTRYPOINT ["perl", "-I/usr/local/lib -I/usr/share/perl5 -I/usr/lib/x86_64-linux-gnu/perl5/5.24/"] 



