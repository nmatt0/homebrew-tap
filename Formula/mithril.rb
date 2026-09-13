class Mithril < Formula
  desc "Firmware content analysis: secrets, SBOM, CVEs and licenses"
  homepage "https://github.com/nmatt0/mithril"
  url "https://github.com/nmatt0/mithril/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "66af3bfbed2ed8b918d0ee5fc6bfae3ffe2f812e82fbf265a6d4866b5fa043ef"
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
