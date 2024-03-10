class Mousequake < Formula
  version "0.0.3"
  desc "Simple tool for auto shaking mouse pointer"
  homepage "https://github.com/KanchiShimono/mousequake"
  license ""

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/KanchiShimono/mousequake/releases/download/v#{version}/mousequake-x86_64-apple-darwin.tar.gz"
      sha256 "fc9f7db523958ddb385c999baba40a145f7e14af349eb3b7173d91e0cab5c6e1"
    elsif Hardware::CPU.arm?
      url "https://github.com/KanchiShimono/mousequake/releases/download/v#{version}/mousequake-aarch64-apple-darwin.tar.gz"
      sha256 "cebd4a781a5d16790171983133a6cc09adec5bd34a563e4bbc048142b6d961b5"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/KanchiShimono/mousequake/releases/download/v#{version}/mousequake-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "cf6760ef9e1b5ccadbd11a44473d343071fb450f4055dfd73b0347824bba9f11"
  end

  def install
    bin.install "mousequake"
  end
end
