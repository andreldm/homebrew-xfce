class Xfce4Settings < Formula
  desc "Xfce's Configuration System"
  homepage "https://xfce.org"
  url "https://archive.xfce.org/src/xfce/xfce4-settings/4.20/xfce4-settings-4.20.0.tar.bz2"
  sha256 "23548da3429a296501fbfdbc98a861ee241b9fdd47e8d5de1781f57c6bbce5a9"
  license "GPL-2.0-or-later"

  depends_on "pkg-config" => :build
  depends_on "gettext"
  depends_on "glib"
  depends_on "gtk+3"
  depends_on "exo"
  depends_on "garcon"
  depends_on "libxfce4ui"
  depends_on "libxfce4util"
  depends_on "xfconf"

  patch :DATA

  def install
    system "./configure",
           "--disable-debug",
           "--disable-wayland",
           "--disable-x11",
           "--disable-visibility",
           "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "true" # TODO
  end
end

__END__
--- a/configure.orig	2025-01-21 20:56:12
+++ a/configure	2025-01-21 20:56:15
@@ -23833,9 +23833,6 @@
 fi
 
 
-if test x"$ENABLE_X11" != x"yes" -a x"$ENABLE_WAYLAND" != x"yes"; then
-  as_fn_error $? "Either both X11 and Wayland support was disabled, or required dependencies are missing. One of the two must be enabled." "$LINENO" 5
-fi
 
 if test x"$ENABLE_X11" != x"yes"; then
     enable_xrandr=no
--- a/xfsettingsd/main.c.orig	2025-01-21 20:56:21
+++ a/xfsettingsd/main.c	2025-01-21 20:56:27
@@ -324,7 +324,6 @@
 
         if (G_UNLIKELY (name_owned && !opt_replace))
         {
-            xfsettings_dbg (XFSD_DEBUG_XSETTINGS, "Another instance is already running. Leaving.");
             g_dbus_connection_close_sync (dbus_connection, NULL, NULL);
             return EXIT_SUCCESS;
         }

