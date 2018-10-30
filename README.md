# Docker image with Perl and IO::Socket::SSL

An image which includes and runs this library, along with Net::SSLeay,
correctly.

## Use

Use in pretty much the same way as an executable:

    docker run -it --rm jjmerelo/perl-io-socket-ssl -e "print @INC"
    
Although it's probably more useful as a base for other images that
need an usable version
of
[`IO::Socket::SSL`](https://metacpan.org/pod/distribution/IO-Socket-SSL/lib/IO/Socket/SSL.pod) and
[`Net::SSLeay`](https://metacpan.org/pod/Net::SSLeay)

## Motivation

After switching from an Ubuntu base to a Debian Slim base to reduce
the footprint of my image, everything stopped working. It took me a
good while to come up with this solution, which includes

* The Perl version (5.24) for which Net::SSLeay was compiled. Also, it
  was compiled for the threaded version, so the base includes that too.
* Debian packages install libraries to all kind of non-standard
  places. In the default perl configurarion, it includes `-I` switches
  to include all those directories.
* Also, `IO::Socket::SSL` needs `Net::SSLeay` during runtime, it's not
  actually installed or declared as a dependency. So this image
  includes that too. 
