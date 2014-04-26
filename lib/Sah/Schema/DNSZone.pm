package Sah::Schema::DNSZone;
# ABSTRACT: Schema for DNS zone

=head1 SYNOPSIS

 use Data::Schema qw(Schema::DNSZone);
 my $zone = {
   records => [
     {owner => ''   , ttl => 300, type => 'NS', host => 'dns1.example.com'},
     {owner => ''   , ttl => 300, type => 'NS', host => 'dns2.example.com'},
     {owner => ''   , type => 'A', address => '1.2.3.4'},
     {owner => 'www', type => 'CNAME', canonical => ''},
     {owner => '', type => 'MX', host => 'mail', priority => 10},
     {owner => 'mail', type => 'A', address => '1.2.3.5'},
   ]
 };
 my $res = ds_validate($zone, 'dns_zone'); # invalid, missing SOA record

=head1 DESCRIPTION

This module contains the schema for validating DNS zone structure. See
the module's source code (or C<$dns_zone_yaml>) to get the YAML
specification.

=cut

use Data::Schema;
use YAML::Syck; $YAML::Syck::ImplicitTyping = 1;
require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw($dns_zone $dns_zone_yaml);

=head1 EXPORTS

=head2 $dns_zone

=head2 $dns_zone_yaml

=head1 SEE ALSO

L<Data::Schema>

=cut

our $dns_zone_yaml = <<'END_OF_SCHEMA';
def:
  ipv4: [str, {set: 1, match: '^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])(\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])){3}$'}]
  email: [str, {set: 1, match: '.+@.+'}]

  base_record:
    - hash
    - set: 1
      minlen: 1
      allow_extra_keys: 1
      required_keys: [type, host]
      keys:
        type: [str, {set: 1}]
        ttl: [int]
        host: [str]

  soa_record:
    - base_record
    - "+required_keys": [email, ttl, refresh, retry, expire]
      "*allow_extra_keys": 0
      "*keys":
        host: [str, {is: ''}]
        email: email
        refresh: [int]
        retry: [int]
        expire: [int]

  ns_record: [base_record, {}]
  a_record: [base_record, {}]
  mx_record: [base_record, {}]
  cname_record: [base_record, {}]

  record:
    - base_record
    - deps:
      - [ [base_record, {allow_extra_keys: 1, keys: {type: [str, {set: 1, is: SOA}]}}], soa_record ]

type: hash

attr_hashes:
  - set: 1
    required_keys: [records]
    allow_extra_keys: 1
    keys:
      records:
        - array
        - set: 1
          of: record
          some_of: [[soa_record, 1, 1]]
          some_of:errmsg: "records must contain exactly 1 valid SOA record"
END_OF_SCHEMA

our $dns_zone = Load($dns_zone_yaml);

sub name {
    'dns_zone';
}

sub schema {
    $dns_zone;
}

1;
