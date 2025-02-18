class Xfce4Appfinder < Formula
  desc "Application launcher and finder for Xfce"
  homepage "https://xfce.org"
  url "https://archive.xfce.org/src/xfce/xfce4-appfinder/4.20/xfce4-appfinder-4.20.0.tar.bz2"
  sha256 "82ca82f77dc83e285db45438c2fe31df445148aa986ffebf2faabee4af9e7304"
  license "GPL-2.0-or-later"

  depends_on "pkg-config" => :build
  depends_on "gettext"
  depends_on "glib"
  depends_on "gtk+3"
  depends_on "garcon"
  depends_on "libxfce4ui"
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
