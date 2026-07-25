class Srcmgr < Formula
  desc "Simple repository manager"
  homepage "https://github.com/KanchiShimono/srcmgr"
  version "0.0.1"
  license ""

  on_macos do
    on_intel do
      url "https://github.com/KanchiShimono/srcmgr/releases/download/v#{version}/srcmgr-x86_64-apple-darwin.tar.gz"
      sha256 "c99a82c5184c56b81e8caf971623d200ed5f29e0ec2c6191ebd07f0556b16165"
    end
    on_arm do
      url "https://github.com/KanchiShimono/srcmgr/releases/download/v#{version}/srcmgr-aarch64-apple-darwin.tar.gz"
      sha256 "c6c05d5cc2050c03d57fa56bff475602de2f843f755a51f02c08a45ae1163036"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/KanchiShimono/srcmgr/releases/download/v#{version}/srcmgr-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ebf1600b251403f003a5b0b6897fd03bce4eca79f7a35e10f4f400a094a04b73"
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
