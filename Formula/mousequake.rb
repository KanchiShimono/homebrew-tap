class Mousequake < Formula
  version "0.0.1"
  desc "Simple tool for auto shaking mouse pointer"
  homepage "https://github.com/KanchiShimono/mousequake"
  url "https://github.com/KanchiShimono/mousequake/releases/download/v#{version}/mousequake-x86_64-apple-darwin.tar.gz.zip"
  sha256 "78a3bebc5ab24ebedc316c59c31e2260b976f7c089946a95aeb55faaf61cdd66"
  license ""

  def install
    bin.install "mousequake"
  end
end
