
class Exo < Formula
  desc "Application library for the Xfce desktop environment"
  homepage "https://xfce.org"
  url "https://archive.xfce.org/src/xfce/exo/4.20/exo-4.20.0.tar.bz2"
  sha256 "4277f799245f1efde01cd917fd538ba6b12cf91c9f8a73fe2035fd5456ec078d"
  license all_of: ["GPL-2.0-or-later", "LGPL-2.1-or-later"]

  depends_on "pkg-config" => :build
  depends_on "gettext"
  depends_on "glib"
  depends_on "gtk+3"
  depends_on "libxfce4ui"
  depends_on "libxfce4util"

  def install
    system "./configure",
           "--disable-debug",
           "--disable-visibility",
           "--disable-gio-unix",
           "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "true" # TODO
  end
end
