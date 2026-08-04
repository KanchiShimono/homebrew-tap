class Srcmgr < Formula
  desc "Simple repository manager"
  homepage "https://github.com/KanchiShimono/srcmgr"
  version "0.0.3"
  license ""

  on_macos do
    on_intel do
      url "https://github.com/KanchiShimono/srcmgr/releases/download/v#{version}/srcmgr-x86_64-apple-darwin.tar.gz"
      sha256 "415690de666eb4c490acd958d86f401ecc7581320e5d71018c21f0f4fc762b45"
    end
    on_arm do
      url "https://github.com/KanchiShimono/srcmgr/releases/download/v#{version}/srcmgr-aarch64-apple-darwin.tar.gz"
      sha256 "875f83204ed5601e90e720646738d9ed25d32f87714037ed0c1379ca1adcf808"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/KanchiShimono/srcmgr/releases/download/v#{version}/srcmgr-x86_64-unknown-linux-musl.tar.gz"
      sha256 "379ad56560909031689d2f0f4c9f9b60a6c2989aa1ca9aa07780ce5211b1b72f"
    end
  end

  def install
    bin.install "sm"
    generate_completions_from_executable(bin/"sm", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
