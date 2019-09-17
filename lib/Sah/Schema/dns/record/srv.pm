package Sah::Schema::dns::record::srv;

# DATE
# VERSION

our $schema = ['dns::record' => {
    summary => 'DNS SRV record',
    "merge.normal.keys" => {
        name => ["dns::record_field::name::allow_underscore"],

        type => ["str", {req=>1, is=>"SRV"}, {}],

        weight => ["uint", {req=>1}, {}],

        port => ["net::port", {req=>1}, {}],

        target => ["net::hostname", {req=>1}, {}],
    },
    "keys.restrict" => 1,
    "merge.add.req_keys" => [qw/data/],
}, {}];

1;
# ABSTRACT:
