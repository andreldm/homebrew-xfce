
class Garcon < Formula
  desc "Freedesktop.org compliant menu library"
  homepage "https://xfce.org"
  url "https://archive.xfce.org/src/xfce/garcon/4.20/garcon-4.20.0.tar.bz2"
  sha256 "7fb8517c12309ca4ddf8b42c34bc0c315e38ea077b5442bfcc4509415feada8f"
  license "LGPL-2.0-only"

  depends_on "pkg-config" => :build
  depends_on "gettext"
  depends_on "glib"
  depends_on "gtk+3"
  depends_on "libxfce4ui"
  depends_on "libxfce4util"

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
