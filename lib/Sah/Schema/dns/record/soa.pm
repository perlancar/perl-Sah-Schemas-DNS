package Sah::Schema::dns::record::soa;

# DATE
# VERSION

our $schema = ['dns::record' => {
    summary => 'DNS SOA record',
    'merge.normal.keys' => {
        name => ["str", {req=>1, is=>""}, {}],
        type => ["str", {req=>1, is=>"SOA"}, {}],

        host => ["any", {
            req=>1,
            of=>[
                ["str", {req=>1, is=>""}, {}],
                ["net::hostname", {req=>1}, {}],
            ],
        }, {}],
        serial => ["uint", {req=>1}, {}],
        refresh => ["uint", {req=>1}, {}],
        retry => ["uint", {req=>1}, {}],
        expire => ["uint", {req=>1}, {}],
        email => ["email", {req=>1}, {}],
    },
    "keys.restrict" => 1,
    "merge.add.req_keys" => [qw/serial refresh retry expire email/],
}, {}];

1;
# ABSTRACT:
