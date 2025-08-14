class Mousequake < Formula
  version "0.0.4"
  desc "Simple tool for automatically shaking the mouse pointer"
  homepage "https://github.com/KanchiShimono/mousequake"
  license ""

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/KanchiShimono/mousequake/releases/download/v#{version}/mousequake-x86_64-apple-darwin.tar.gz"
      sha256 "262527fab2eec4403d23fc922760cb02c5bbffbee9e095c554fdc8c2fce9db25"
    elsif Hardware::CPU.arm?
      url "https://github.com/KanchiShimono/mousequake/releases/download/v#{version}/mousequake-aarch64-apple-darwin.tar.gz"
      sha256 "d346586e807d2093848c1357f10b4eef770426a82d7b7a00029527e9946204c9"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/KanchiShimono/mousequake/releases/download/v#{version}/mousequake-x86_64-unknown-linux-musl.tar.gz"
    sha256 "2c8d802538b0aa45f81fb28d219e51dc00f87bad301f93ad6a82be2e61f66e0d"
  end

  def install
    bin.install "mousequake"
    generate_completions_from_executable(bin/"mousequake", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mousequake --version", 2)
  end
end
