package Sah::Schema::dns::records_of_known_types;

# DATE
# VERSION

our $schema = [array => {
    summary => 'Array of DNS records (restricted to known types only)',
    of => ["dns::record_of_known_types", {req=>1}, {}],
}, {}];

# TODO add constraint: there can only be at most 1 SOA record

1;
# ABSTRACT:
