
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Kelp interface to Rose::DB::Object",
  "AUTHOR" => "Stefan Geneshky <minimal\@cpan.org>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Kelp-Module-RDBO",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Kelp::Module::RDBO",
  "PREREQ_PM" => {
    "Class::Inspector" => 0,
    "Kelp::Base" => 0,
    "Module::Find" => 0,
    "Plack::Util" => 0,
    "Rose::DB" => 0,
    "Rose::DB::Object" => 0,
    "strict" => 0
  },
  "TEST_REQUIRES" => {
    "DBD::SQLite" => 0,
    "File::Temp" => 0,
    "Rose::DB::Object::Helpers" => 0,
    "Test::More" => 0,
    "lib" => 0
  },
  "VERSION" => "0.105",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



