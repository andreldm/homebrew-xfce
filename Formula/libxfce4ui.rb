class Libxfce4ui < Formula
  desc "Widgets library for the Xfce desktop environment"
  homepage "https://xfce.org"
  url "https://archive.xfce.org/src/xfce/libxfce4ui/4.20/libxfce4ui-4.20.0.tar.bz2"
  sha256 "75e8996984f20375aadecd5c16f5147c211ed0bd26d7861ab0257561eb76eaee"
  license "LGPL-2.0-only"

  depends_on "pkg-config" => :build
  depends_on "gettext"
  depends_on "glib"
  depends_on "libxfce4util"
  depends_on "xfconf"

  def install
    system "./configure",
           "--disable-debug",
           "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "true" # TODO
  end
end
