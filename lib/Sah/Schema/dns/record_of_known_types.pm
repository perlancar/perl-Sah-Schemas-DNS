package Sah::Schema::dns::record_of_known_types;

# DATE
# VERSION

our $schema = ['dns::record' => {
    summary => 'DNS record structure (restricted to known types only)',
    'merge.normal.keys' => {
        type => ["str", {req=>1, match=>'\A(?:A|CNAME|MX|NS|SOA|SRV|SSHFP|TXT)\z'}, {}],
    },
    if => [
        ['$data["type"] eq "A"'    , ["dns::record::a"     , {}, {}]],
        ['$data["type"] eq "CNAME"', ["dns::record::cname" , {}, {}]],
        ['$data["type"] eq "MX"'   , ["dns::record::mx"    , {}, {}]],
        ['$data["type"] eq "NS"'   , ["dns::record::ns"    , {}, {}]],
        ['$data["type"] eq "SOA"'  , ["dns::record::soa"   , {}, {}]],
        ['$data["type"] eq "SOA"'  , ["dns::record::srv"   , {}, {}]],
        ['$data["type"] eq "SOA"'  , ["dns::record::sshfp" , {}, {}]],
        ['$data["type"] eq "TXT"'  , ["dns::record::txt"   , {}, {}]],
    ],
    "if.op" => "and",
}, {}];

1;
# ABSTRACT:
