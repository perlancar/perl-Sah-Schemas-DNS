package Sah::Schema::dns::records;

# DATE
# VERSION

our $schema = [array => {
    summary => 'Array of DNS records',
    of => ["dns::record", {req=>1}, {}],
}, {}];

# TODO add constraint: there can only be at most 1 SOA record

1;
# ABSTRACT:
