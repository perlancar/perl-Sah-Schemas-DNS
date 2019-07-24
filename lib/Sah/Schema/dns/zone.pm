package Sah::Schema::dns::zone;

# DATE
# VERSION

our $schema = [hash => {
    summary => 'DNS zone structure',
    keys => {
        records => ["dns::records", {req=>1}, {}],
    },
    req_keys => [qw/records/],
}, {}];

1;
# ABSTRACT:
