class Tmux < Formula
  desc "Terminal multiplexer (farm fork: 3.6b + copy-mode crash fix)"
  homepage "https://github.com/edihasaj/tmux"
  # farm fork of tmux 3.6b with the upstream copy-mode heap-corruption fix
  # cherry-picked (grid_trim_history clears vacated slots — tmux commit 035a2f35,
  # GitHub issues 4777/4790). Fixes the SIGABRT in grid_free_line on copy-mode
  # entry that crashes long-running agent farms on Apple Silicon.
  url "https://github.com/edihasaj/tmux/archive/refs/tags/farm-3.6b.1.tar.gz"
  sha256 "4aa61aca68d7263d519c47040040dde264340c2ae7c1624d32f73229026cdb6b"
  version "3.6b.1"
  license "ISC"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkgconf" => :build
  depends_on "libevent"
  depends_on "ncurses"
  depends_on "utf8proc"

  uses_from_macos "bison" => :build # for yacc

  conflicts_with "tmux", because: "both install a `tmux` binary"

  def install
    system "sh", "autogen.sh"

    args = %W[
      --enable-sixel
      --sysconfdir=#{etc}
      --enable-utf8proc
    ]

    system "./configure", *args, *std_configure_args
    system "make", "install"

    pkgshare.install "example_tmux.conf"
  end

  test do
    system bin/"tmux", "-V"

    require "pty"

    socket = testpath/tap.user
    PTY.spawn bin/"tmux", "-S", socket, "-f", File::NULL
    sleep 10

    assert_path_exists socket
    assert_predicate socket, :socket?
    assert_equal "no server running on #{socket}",
                 shell_output("#{bin}/tmux -S#{socket} list-sessions 2>&1", 1).chomp
  end
end
