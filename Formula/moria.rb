class Moria < Formula
  desc "Firmware/IoT image identification and extraction tool"
  homepage "https://github.com/nmatt0/moria"
  url "https://github.com/nmatt0/moria/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "18f1be877e280370d26504b36f381b780b31a3fc1b3bb7c9fef81cba140310bc"
  license "MIT"
  head "https://github.com/nmatt0/moria.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "lz4"
  depends_on "xz"
  depends_on "zstd"

  on_linux do
    depends_on "zlib"
  end

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_match "moria", shell_output("#{bin}/moria --help 2>&1")
  end
end
