class Xfce4DevTools < Formula
  desc "Autoconf macros and scripts to augment app build systems"
  homepage "https://xfce.org"
  url "https://archive.xfce.org/src/xfce/xfce4-dev-tools/4.20/xfce4-dev-tools-4.20.0.tar.bz2"
  sha256 "1fba39a08a0ecc771eaa3a3b6e4272a4f0b9e7c67d0f66e780cd6090cd4466aa"
  license "GPL-2.0-or-later"

  depends_on "meson" => :build
  depends_on "pkg-config" => :build
  depends_on "automake"
  depends_on "gtk-doc"
  depends_on "m4"
  depends_on "libtool"
  depends_on "glib"

  def install
    inreplace "scripts/xdt-autogen.in", "XDT_PROG_LIBTOOLIZE=\"libtoolize\"", "XDT_PROG_LIBTOOLIZE=\"glibtoolize\""

    system "./configure",
           "--disable-debug",
           "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "true" # TODO
  end
end
