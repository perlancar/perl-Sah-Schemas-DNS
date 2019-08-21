package Sah::Schema::dns::record::ns;

# DATE
# VERSION

our $schema = ['dns::record' => {
    summary => 'DNS NS record',
    "merge.normal.keys" => {
        name => ["dns::record_field::name::disallow_underscore"],

        type => ["str", {req=>1, is=>"NS"}, {}],
    },
    "keys.restrict" => 1,
    "merge.add.req_keys" => [qw/host/],
}, {}];

1;
# ABSTRACT:
