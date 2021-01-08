#!/usr/bin/env perl

use strict;
use warnings;
use autodie;

use Pod::Man;

my ($perlpath, $bindir, $mandir, $sysconfdir, $version) = @ARGV;

$perlpath   //= '/usr/bin/env perl';
$sysconfdir //= '/usr/local/etc/';
$version    //= '2.00';

open my $yin,  '<', 'yasql.in';
open my $yout, '>', 'yasql';

for (my $i = 0; <$yin>; $i++) {
    if ($i == 0) {
        print $yout "#!$perlpath\n";
    }
    elsif (/^\$sysconfdir\s+= /) {
        print $yout qq{\$sysconfdir = "$sysconfdir";\n};
    }
    elsif (/^\$VERSION\s+= /) {
        print $yout qq{\$VERSION = "$version";\n};
    }
    else {
        print $yout $_;
    }
}

close $yout;
close $yin;

my $pod = Pod::Man->new (section => 1);
$pod->parse_from_file ('yasql', 'yasql.1');

print "Configuration successful.\n";
