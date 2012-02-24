use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'WWW::eBridge',
    AUTHOR              => q{Miguel Pereira <perlproxy@cpan.org>},
    VERSION_FROM        => 'lib/WWW/eBridge.pm',
    ABSTRACT_FROM       => 'lib/WWW/eBridge.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'WWW-eBridge-*' },
);
