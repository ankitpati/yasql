#!/usr/bin/env perl

use strict;
use warnings;
use autodie;

use File::Path qw(make_path);

my ($installpath, $bindir, $mandir, $sysconfdir) = @ARGV;

print "Installing yasql to $bindir/yasql\n";
make_path $bindir;
system $installpath, qw(-m 755 yasql), "$bindir/yasql";

unless (-e "$sysconfdir/yasql.conf") {
    print "Installing yasql.conf to $sysconfdir/yasql.conf\n";
    make_path $sysconfdir;
    system $installpath, qw(-m 644 yasql.conf), "$sysconfdir/yasql.conf";
}
else {
    print "$sysconfdir/yasql.conf exists, skipping config file installation.\n";
    print "Read documentation for info on any new configuration directives.\n";
}

if (-f "yasql.1") {
    print "Installing yasql.1 man page to $mandir/man1/yasql.1\n";
    make_path "$mandir/man1";
    system $installpath, qw(-m 644 yasql.1), "$mandir/man1/yasql.1";
}
else {
    warn "yasql.1 not found, use perldoc $bindir/yasql to read the docs\n";
}

print "Installation successful.\n";
