class Libxfce4ui < Formula
  desc "Widgets library for the Xfce desktop environment"
  homepage "https://xfce.org"
  url "https://archive.xfce.org/src/xfce/libxfce4ui/4.20/libxfce4ui-4.20.0.tar.bz2"
  sha256 "75e8996984f20375aadecd5c16f5147c211ed0bd26d7861ab0257561eb76eaee"
  license "LGPL-2.0-only"

  depends_on "pkg-config" => :build
  depends_on "gettext"
  depends_on "glib"
  depends_on "gtk+3"
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
--- configure.orig	2025-01-21 18:52:05
+++ configure	2025-01-21 18:52:11
@@ -19355,9 +19355,7 @@
 fi


-if test x"$ENABLE_X11" != x"yes" -a x"$ENABLE_WAYLAND" != x"yes"; then
-  as_fn_error $? "Either both X11 and Wayland support was disabled, or required dependencies are missing. One of the two must be enabled." "$LINENO" 5
-fi
+

 if test x"$ENABLE_X11" != x"yes"; then
     enable_libsm=no
