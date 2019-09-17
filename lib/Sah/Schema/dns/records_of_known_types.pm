package Sah::Schema::dns::records_of_known_types;

# DATE
# VERSION

our $schema = [array => {
    summary => 'Array of DNS records (restricted to known types only)',
    of => ["dns::record_of_known_types", {req=>1}, {}],
}, {}];

# TODO add constraint: there can only be at most 1 SOA record
# TODO add constraint: CNAME record cannot be mixed with other records for the same name
# TODO q: can there be multiple CNAME records for a name?
# TODO add constraint: ordering?

1;
# ABSTRACT:
