package Sah::Schema::dns::record::mx;

# DATE
# VERSION

our $schema = ['dns::record' => {
    summary => 'DNS MX record',
    "merge.normal.keys" => {
        type => ["str", {req=>1, is=>"MX"}, {}],

        host => ["net::hostname", {req=>1}, {}],
    },
    "keys.restrict" => 1,
    "merge.add.req_keys" => [qw/host prio/],
}, {}];

1;
# ABSTRACT:
