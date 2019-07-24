package Sah::Schema::dns::record::a;

# DATE
# VERSION

our $schema = ['dns::record' => {
    summary => 'DNS A record',
    'merge.normal.keys' => {
        type => ["str", {req=>1, is=>"A"}, {}],

        address => ["net::ipv4", {req=>1}, {}],
    },
    "keys.restrict" => 1,
    "merge.add.req_keys" => [qw/address/],
}, {}];

1;
# ABSTRACT:
