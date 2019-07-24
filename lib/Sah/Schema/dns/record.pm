package Sah::Schema::dns::record;

# DATE
# VERSION

our $schema = [hash => {
    summary => 'DNS record structure',
    keys => {
        name => ["str", {req=>1}, {}],
        type => ["str", {req=>1, match=>'\A(?:[A-Z]([A-Z0-9]+|[A-Z0-9-]*[A-Z0-9])?|\*)\z'}, {}],
        ttl  => ["uint", {}, {}],
        prio => ["uint", {req=>1}, {}],

        host => ["net::hostname", {req=>1}, {}],
    },
    "keys.restrict" => 0,
    req_keys => [qw/name type/],
}, {}];

1;
# ABSTRACT:
