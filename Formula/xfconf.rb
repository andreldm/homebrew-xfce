class Xfconf < Formula
  desc "D-Bus-based configuration storage system for Xfce"
  homepage "https://xfce.org"
  url "https://archive.xfce.org/src/xfce/xfconf/4.20/xfconf-4.20.0.tar.bz2"
  sha256 "8bc43c60f1716b13cf35fc899e2a36ea9c6cdc3478a8f051220eef0f53567efd"
  license "GPL-2.0-or-later"

  depends_on "pkg-config" => :build
  depends_on "gettext"
  depends_on "glib"
  depends_on "libxfce4util"

  def install
    system "./configure",
           "--disable-debug",
           "--disable-visibility",
           "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "true" # TODO
  end
end
