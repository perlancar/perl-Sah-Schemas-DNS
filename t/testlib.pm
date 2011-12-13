use strict;
use warnings;
use Data::Schema;
use Data::Schema::Schema::DNSZone;
use Storable qw(dclone);

#use YAML;

my $sch_ = $Data::Schema::Schema::DNSZone::DS_SCHEMAS->{dns_zone};
my $ds = Data::Schema->new(schema => $dns_zone);

sub valid($$$) {
    my ($data, $sub, $test_name) = @_;
    my $backup = dclone($data);
    $sub->($backup);
    #print Dump($backup);
    my $res = $ds->validate($backup);
    ok($res->{success}, $test_name);
    is_deeply($res->{errors}, [], "$test_name (error details)");
}

sub invalid($$$) {
    my ($data, $sub, $test_name) = @_;
    my $backup = dclone($data);
    $sub->($backup);
    my $res = $ds->validate($backup);
    ok(!$res->{success}, $test_name);
}

1;
