package Sah::Schema::dns::record::txt;

# DATE
# VERSION

our $schema = ['dns::record' => {
    summary => 'DNS TXT record',
    "merge.normal.keys" => {
        name => ["dns::record_field::name::allow_underscore"],

        type => ["str", {req=>1, is=>"TXT"}, {}],

        text => ["str", {req=>1}, {}],
    },
    "keys.restrict" => 1,
    "merge.add.req_keys" => [qw/text/],
}, {}];

1;
# ABSTRACT:
