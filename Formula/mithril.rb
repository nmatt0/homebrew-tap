class Mithril < Formula
  desc "Firmware content analysis: secrets, SBOM, CVEs and licenses"
  homepage "https://github.com/nmatt0/mithril"
  url "https://github.com/nmatt0/mithril/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "21386606cf0ee105bdf675d1c59322f84cd9e78cfa2e874132b510109cf981f5"
  license "MIT"
  head "https://github.com/nmatt0/mithril.git", branch: "master"

  depends_on "cmake" => :build

  # Optional at runtime, not linked: trufflehog (live secret verification),
  # curl/unzip (CVE mirror fetch/rebuild via --fetch-db/--update-db).

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_match "mithril", shell_output("#{bin}/mithril --help 2>&1")
  end
end
