#!/usr/bin/perl -w
use strict;
use Gnome2;

use constant TESTS => 2;
use Test::More tests => TESTS;

# $Header$

###############################################################################

SKIP: {
  our $application;
  do "t/TestBoilerplate";

  skip("GnomeThumbnail is new in 2.0.6", 2)
    unless (Gnome2 -> check_version(2, 0, 6));

  #############################################################################

  my $uri = "file:///usr/share/pixmaps/yes.xpm";
  my $file = "/usr/share/pixmaps/yes.xpm";
  my $mtime = (stat($file))[9];

  my $factory = Gnome2::ThumbnailFactory -> new("normal");
  isa_ok($factory, "Gnome2::ThumbnailFactory");

  $factory -> lookup($uri, $mtime);
  $factory -> has_valid_failed_thumbnail($uri, $mtime);
  $factory -> can_thumbnail($uri, "image/xpm", $mtime);

  my $thumbnail = $factory -> generate_thumbnail($uri, $mtime);
  isa_ok($thumbnail, "Gtk2::Gdk::Pixbuf");

  $factory -> save_thumbnail($thumbnail, $uri, $mtime);
  $factory -> create_failed_thumbnail($uri, $mtime);

  # FIXME: why do these segfault?
  # $thumbnail -> has_uri($uri);
  # $thumbnail -> is_valid($uri, $mtime);

  $thumbnail -> md5($uri);
  $thumbnail -> path_for_uri($uri, "large");
  $thumbnail -> scale_down_pixbuf(5, 5);
}
