#!/usr/bin/perl -w
use strict;
use Test::More tests => 7;
use Gnome2;

# $Header$

###############################################################################

SKIP: {
  skip("You don't appear to have the GNOME session manager running.", 7)
    unless (-d "$ENV{ HOME }/.gconfd" &&
            -d "$ENV{ HOME }/.gnome2");

  skip("Couldn't connect to the session manager.", 7)
    unless (Gnome2::Client -> new() -> connected());

  Gnome2::Program -> module_register("libgnome");
  ok(Gnome2::Program -> module_registered("libgnome"));

  # XXX
  # isa_ok(Gnome2::Program -> module_load("/usr/lib/libgnome-2.so"),
  #        "Gnome2::ModuleInfo");

  my $application = Gnome2::Program -> init("Test",
                                            "0.1",
                                            "libgnomeui",
                                            human_readable_name => "Test v0.1");

  isa_ok($application, "Gnome2::Program");
  is($application -> get(), $application);

  is($application -> get_human_readable_name(), "Test v0.1");
  is($application -> get_app_id(), "Test");
  is($application -> get_app_version(), "0.1");

  ok(-e $application -> locate_file("libdir", "libgnome-2.so", 1));

  ###############################################################################

  Glib::Idle -> add(sub {
    Gtk2 -> main_quit();
    return 0;
  });

  Gtk2 -> main();
}