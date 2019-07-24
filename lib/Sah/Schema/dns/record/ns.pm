package Sah::Schema::dns::record::ns;

# DATE
# VERSION

our $schema = ['dns::record' => {
    summary => 'DNS NS record',
    "merge.normal.keys" => {
        type => ["str", {req=>1, is=>"NS"}, {}],
    },
    "keys.restrict" => 1,
    "merge.add.req_keys" => [qw/host/],
}, {}];

1;
# ABSTRACT:
