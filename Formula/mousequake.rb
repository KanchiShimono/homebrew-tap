class Mousequake < Formula
  version "0.0.1"
  desc "Simple tool for auto shaking mouse pointer"
  homepage "https://github.com/KanchiShimono/mousequake"
  license ""

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/KanchiShimono/mousequake/releases/download/v#{version}/mousequake-x86_64-apple-darwin.tar.gz.zip"
      sha256 "78a3bebc5ab24ebedc316c59c31e2260b976f7c089946a95aeb55faaf61cdd66"
    elsif Hardware::CPU.arm?
      url "https://github.com/KanchiShimono/mousequake/releases/download/v#{version}/mousequake-aarch64-apple-darwin.tar.gz.zip"
      sha256 "a96f5bddcc55b15ada84f0c70817e189bccba97c222f05597793a63fed237550"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/KanchiShimono/mousequake/releases/download/v#{version}/mousequake-x86_64-unknown-linux-gnu.tar.gz.zip"
    sha256 "27366354c4e74e59d94c1e28d30ec0178a61137390c084b97f5f97c402dc04fc"
  end

  def install
    bin.install "mousequake"
  end
end
