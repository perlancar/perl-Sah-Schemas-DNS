package Sah::Schema::dns::record_field::name::disallow_underscore;

# DATE
# VERSION

my $re_word = "(?:[a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\\-]*[a-zA-Z0-9]|\\*)";

our $schema = [str => {
    summary => 'The "name" field in DNS record, underscore not allowed',
    match =>
        join(
            '',
            "^(?:", (
                "",    # empty
                "|",
                "(?:(?:$re_word\\.)*$re_word)", # dot-separated (word|"*")
            ),
            ")\$",
        ),
}, {}];

1;
# ABSTRACT:
