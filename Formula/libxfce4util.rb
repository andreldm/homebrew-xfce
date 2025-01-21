class Libxfce4util < Formula
  desc "Basic utility library for Xfce"
  homepage "https://xfce.org"
  url "https://archive.xfce.org/src/xfce/libxfce4util/4.20/libxfce4util-4.20.0.tar.bz2"
  sha256 "21493f9c9995a282823db93839f6b9f06ae31edb094191ba9acf04d932a2b592"
  license "LGPL-2.0-only"

  depends_on "pkg-config" => :build
  depends_on "gettext"
  depends_on "glib"

  # uses_from_macos "perl" => :build

  def install
    # ENV.prepend_create_path "PERL5LIB", Formula["intltool"].libexec/"lib/perl5" unless OS.mac?

    system "./configure",
           "--disable-debug",
           "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    assert_predicate prefix, :exist? # stub
  end
end
