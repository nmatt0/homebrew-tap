class Moria < Formula
  desc "Firmware/IoT image identification and extraction tool"
  homepage "https://github.com/nmatt0/moria"
  url "https://github.com/nmatt0/moria/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "76fb476dbbe296f7390310f52f568388469e4799b0be9d8c31ae762de363495a"
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
