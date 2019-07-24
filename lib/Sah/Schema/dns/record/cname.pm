package Sah::Schema::dns::record::cname;

# DATE
# VERSION

our $schema = ['dns::record' => {
    summary => 'DNS CNAME record',
    "merge.normal.keys" => {
        type => ["str", {req=>1, is=>"CNAME"}, {}],

        canon => ["net::hostname", {req=>1}, {}],
    },
    "keys.restrict" => 1,
    "merge.add.req_keys" => [qw/canon/],
}, {}];

1;
# ABSTRACT:
