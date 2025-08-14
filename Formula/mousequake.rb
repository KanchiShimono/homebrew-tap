class Mousequake < Formula
  version "0.0.5"
  desc "Simple tool for automatically shaking the mouse pointer"
  homepage "https://github.com/KanchiShimono/mousequake"
  license ""

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/KanchiShimono/mousequake/releases/download/v#{version}/mousequake-x86_64-apple-darwin.tar.gz"
      sha256 "ddba6e2d6647c8d03eb53aedec27080ade241d71069158b30fbbd7933a6d0627"
    elsif Hardware::CPU.arm?
      url "https://github.com/KanchiShimono/mousequake/releases/download/v#{version}/mousequake-aarch64-apple-darwin.tar.gz"
      sha256 "11d023712b9210d00b7ccb2f250ea7c02ac7f228531a51e21413ec8500d3a729"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/KanchiShimono/mousequake/releases/download/v#{version}/mousequake-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e91a9ce98906b4afb3885a02107128cd68f72137b7d9ea378a2007a5ffff5a8e"
    else
      odie "mousequake is only available for x86_64 architecture on Linux"
    end
  end

  def install
    bin.install "mousequake"
    generate_completions_from_executable(bin/"mousequake", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mousequake --version", 2)
  end
end
