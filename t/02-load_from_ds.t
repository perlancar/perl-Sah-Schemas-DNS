#!perl -T

use strict;
use warnings;
use Test::More tests => 2;
use File::Slurp;
use FindBin '$Bin';
use YAML::Syck; $YAML::Syck::ImplicitTyping = 1;
use Data::Schema qw(Schema::DNSZone);

my $zone1 = Load(scalar read_file("$Bin/data/zone1.yml"));

ok( ds_validate($zone1, "dns_zone")->{success}, "load schema from DS 1");
delete $zone1->{"records"};
ok(!ds_validate($zone1, "dns_zone")->{success}, "load schema from DS 2");
