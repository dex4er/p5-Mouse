#!/usr/bin/perl
# This is automatically generated by author/import-moose-test.pl.
# DO NOT EDIT THIS FILE. ANY CHANGES WILL BE LOST!!!
use t::lib::MooseCompat;

use strict;
use warnings;

use Test::More;
use Test::Exception;


{
    package My::Custom::Meta::Attr;
    use Mouse;

    extends 'Mouse::Meta::Attribute';
}

{
    package My::Fancy::Role;
    use Mouse::Role;

    has 'bling_bling' => (
        metaclass => 'My::Custom::Meta::Attr',
        is        => 'rw',
        isa       => 'Str',
    );
}

{
    package My::Class;
    use Mouse;

    with 'My::Fancy::Role';
}

my $c = My::Class->new;
isa_ok($c, 'My::Class');

ok($c->meta->has_attribute('bling_bling'), '... got the attribute');

isa_ok($c->meta->get_attribute('bling_bling'), 'My::Custom::Meta::Attr');

done_testing;
