package Sah::Schema::dns::zone;

# DATE
# VERSION

our $schema = [hash => {
    summary => 'DNS zone structure',
    keys => {
        records => ["dns::records_of_known_types", {req=>1}, {}],
    },
    "keys.restrict" => 0,
    req_keys => [qw/records/],
}, {}];

1;
# ABSTRACT:
