class Xfce4Dict < Formula
  desc "A client program to query different dictionaries"
  homepage "https://xfce.org"
  url "https://archive.xfce.org/src/apps/xfce4-dict/0.8/xfce4-dict-0.8.8.tar.bz2"
  sha256 "0d0cb079d276d82c174a52c94ee4df12df490a525befc44650e261f8e5eae916"
  license "GPL-2.0-or-later"

  depends_on "pkg-config" => :build
  depends_on "gettext"
  depends_on "glib"
  depends_on "gtk+3"
  depends_on "libxfce4ui"
  depends_on "libxfce4util"

  patch :DATA

  def install
    system "sed -i '' '/panel-plugin/d' Makefile.in"
    system "sed -i '' '/gdkx.h/d' src/popup_plugin.c"
    system "./configure",
           "--disable-debug",
           "--prefix=#{prefix}"

    system "make", "install"
  end

  test do
    system "true" # TODO
  end
end

__END__
--- a/configure.orig	2025-03-03 12:23:12
+++ a/configure	2025-03-03 12:31:59
@@ -16241,71 +16241,19 @@
 
 
 
-  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking for libxfce4panel-2.0 >= 4.10.0" >&5
-printf %s "checking for libxfce4panel-2.0 >= 4.10.0... " >&6; }
-  if $PKG_CONFIG "--atleast-version=4.10.0" "libxfce4panel-2.0" >/dev/null 2>&1; then
-    LIBXFCE4PANEL_VERSION=`$PKG_CONFIG --modversion "libxfce4panel-2.0"`
-    { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $LIBXFCE4PANEL_VERSION" >&5
-printf "%s\n" "$LIBXFCE4PANEL_VERSION" >&6; }
 
-    { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking LIBXFCE4PANEL_CFLAGS" >&5
-printf %s "checking LIBXFCE4PANEL_CFLAGS... " >&6; }
-    LIBXFCE4PANEL_CFLAGS=`$PKG_CONFIG --cflags "libxfce4panel-2.0"`
-    { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $LIBXFCE4PANEL_CFLAGS" >&5
-printf "%s\n" "$LIBXFCE4PANEL_CFLAGS" >&6; }
 
-    { printf "%s\n" "$as_me:${as_lineno-$LINENO}: checking LIBXFCE4PANEL_LIBS" >&5
-printf %s "checking LIBXFCE4PANEL_LIBS... " >&6; }
-    LIBXFCE4PANEL_LIBS=`$PKG_CONFIG --libs "libxfce4panel-2.0"`
-    { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $LIBXFCE4PANEL_LIBS" >&5
-printf "%s\n" "$LIBXFCE4PANEL_LIBS" >&6; }
 
-    LIBXFCE4PANEL_REQUIRED_VERSION=4.10.0
 
 
 
 
 
 
-    if test x"LIBXFCE4PANEL" = x"GLIB"; then
 
-printf "%s\n" "#define G_LOG_USE_STRUCTURED 1" >>confdefs.h
 
-    fi
 
 
-
-
-  elif $PKG_CONFIG --exists "libxfce4panel-2.0" >/dev/null 2>&1; then
-    xdt_cv_version=`$PKG_CONFIG --modversion "libxfce4panel-2.0"`
-    { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: found, but $xdt_cv_version" >&5
-printf "%s\n" "found, but $xdt_cv_version" >&6; }
-
-
-      echo "*** The required package libxfce4panel-2.0 was found on your system,"
-      echo "*** but the installed version ($xdt_cv_version) is too old."
-      echo "*** Please upgrade libxfce4panel-2.0 to atleast version 4.10.0, or adjust"
-      echo "*** the PKG_CONFIG_PATH environment variable if you installed"
-      echo "*** the new version of the package in a nonstandard prefix so"
-      echo "*** pkg-config is able to find it."
-      exit 1
-
-  else
-    { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: not found" >&5
-printf "%s\n" "not found" >&6; }
-
-
-      echo "*** The required package libxfce4panel-2.0 was not found on your system."
-      echo "*** Please install libxfce4panel-2.0 (atleast version 4.10.0) or adjust"
-      echo "*** the PKG_CONFIG_PATH environment variable if you"
-      echo "*** installed the package in a nonstandard prefix so that"
-      echo "*** pkg-config is able to find it."
-      exit 1
-
-  fi
-
-
-
   # minimum supported version of pkg-config
   xdt_cv_PKG_CONFIG_MIN_VERSION=0.9.0
 
@@ -16692,7 +16640,7 @@
 
 
 
-ac_config_files="$ac_config_files Makefile lib/Makefile panel-plugin/Makefile src/Makefile po/Makefile.in icons/Makefile icons/16x16/Makefile icons/24x24/Makefile icons/32x32/Makefile icons/48x48/Makefile icons/64x64/Makefile icons/96x96/Makefile icons/128x128/Makefile icons/scalable/Makefile"
+ac_config_files="$ac_config_files Makefile lib/Makefile src/Makefile po/Makefile.in icons/Makefile icons/16x16/Makefile icons/24x24/Makefile icons/32x32/Makefile icons/48x48/Makefile icons/64x64/Makefile icons/96x96/Makefile icons/128x128/Makefile icons/scalable/Makefile"
 
 cat >confcache <<\_ACEOF
 # This file is a shell script that caches the results of configure
@@ -17716,7 +17664,6 @@
     "po-directories") CONFIG_COMMANDS="$CONFIG_COMMANDS po-directories" ;;
     "Makefile") CONFIG_FILES="$CONFIG_FILES Makefile" ;;
     "lib/Makefile") CONFIG_FILES="$CONFIG_FILES lib/Makefile" ;;
-    "panel-plugin/Makefile") CONFIG_FILES="$CONFIG_FILES panel-plugin/Makefile" ;;
     "src/Makefile") CONFIG_FILES="$CONFIG_FILES src/Makefile" ;;
     "po/Makefile.in") CONFIG_FILES="$CONFIG_FILES po/Makefile.in" ;;
     "icons/Makefile") CONFIG_FILES="$CONFIG_FILES icons/Makefile" ;;
