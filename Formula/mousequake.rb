class Mousequake < Formula
  version "0.0.2"
  desc "Simple tool for auto shaking mouse pointer"
  homepage "https://github.com/KanchiShimono/mousequake"
  license ""

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/KanchiShimono/mousequake/releases/download/v#{version}/mousequake-x86_64-apple-darwin.tar.gz.zip"
      sha256 "80acd739b513d9e05d473d950351f9749016c8301ad20ebc14e90ac92322b48f"
    elsif Hardware::CPU.arm?
      url "https://github.com/KanchiShimono/mousequake/releases/download/v#{version}/mousequake-aarch64-apple-darwin.tar.gz.zip"
      sha256 "308c52c6f68309ea64c9ee1ae4479d8a4679ff2fd82f665ff5e2454a178fb3b8"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/KanchiShimono/mousequake/releases/download/v#{version}/mousequake-x86_64-unknown-linux-gnu.tar.gz.zip"
    sha256 "8b8cf1612705a326e54c8ddac35fab82b0a88d8012b8be4c8e0519e23b198c6e"
  end

  def install
    bin.install "mousequake"
  end
end
