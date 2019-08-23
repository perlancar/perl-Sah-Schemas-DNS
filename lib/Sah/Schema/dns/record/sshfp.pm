package Sah::Schema::dns::record::sshfp;

# DATE
# VERSION

our $schema = ['dns::record' => {
    summary => 'DNS SSHFP record',
    "merge.normal.keys" => {
        name => ["dns::record_field::name::disallow_underscore"],

        type => ["str", {req=>1, is=>"SSHFP"}, {}],

        algo => ["int", {req=>1, in=>[1,2,3,4]}, {}], # algorithm

        fptype => ["int", {req=>1, in=>[1,2]}, {}], # fingerprint type

        fp => ["hexstr", {req=>1}, {}], # fingerprint
    },
    "keys.restrict" => 1,
    "merge.add.req_keys" => [qw/algo fptype fp/],
}, {}];

1;
# ABSTRACT:

=head1 SEE ALSO

L<https://en.wikipedia.org/wiki/SSHFP_record>
