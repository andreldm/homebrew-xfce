class Thunar < Formula
  desc "Modern, fast and easy-to-use file manager for Xfce"
  homepage "https://xfce.org"
  url "https://archive.xfce.org/src/xfce/thunar/4.20/thunar-4.20.0.tar.bz2"
  sha256 "27731a76f3aecf3752b1ca35afad89e264c52244f70083d933507dd4a17548b0"
  license all_of: ["GPL-2.0-or-later", "LGPL-2.1-only"]

  depends_on "pkg-config" => :build
  depends_on "gettext"
  depends_on "glib"
  depends_on "gtk+3"
  depends_on "adwaita-icon-theme"
  depends_on "exo"
  depends_on "garcon"
  depends_on "libxfce4ui"
  depends_on "libxfce4util"
  depends_on "xfconf"

  patch :DATA

  def install
    system "./configure",
           "--disable-debug",
           "--disable-gio-unix",
           "--disable-wallpaper-plugin",
           "--prefix=#{prefix}"

    system "make", "install"
  end

  test do
    system "true" # TODO
  end
end

__END__
--- a/configure.orig	2025-01-22 15:17:07
+++ a/configure	2025-01-22 15:17:31
@@ -18189,9 +18189,6 @@
 
 
 
-  if test x"$no_x" = x"yes"; then
-    as_fn_error $? "X Window system libraries and header files are required" "$LINENO" 5
-  fi
 
 
 
--- a/thunar/thunar-session-client.c.orig	2025-01-22 15:27:18
+++ a/thunar/thunar-session-client.c	2025-01-22 15:27:25
@@ -42,7 +42,6 @@
 #include "thunar/thunar-private.h"
 #include "thunar/thunar-session-client.h"
 
-#include <gdk/gdkx.h>
 #include <glib/gstdio.h>
 
 
