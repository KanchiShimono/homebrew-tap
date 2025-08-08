class Assam < Formula
  desc "AWS SAML authentication CLI tool for Azure Entra ID"
  version "0.0.1-alpha.2"
  homepage "https://github.com/KanchiShimono/assam-rs"
  license ""

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/KanchiShimono/assam-rs/releases/download/v#{version}/assam-x86_64-apple-darwin.tar.gz"
      sha256 "496b2a4de230ef1cca2ddbf4c60cb5059702773550284b7386b8e06d92ebe88b"
    elsif Hardware::CPU.arm?
      url "https://github.com/KanchiShimono/assam-rs/releases/download/v#{version}/assam-aarch64-apple-darwin.tar.gz"
      sha256 "d23ebb1485a0be645be5897b1a2c13a5129658573ca0bb111e7d77d5c398e6c1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/KanchiShimono/assam-rs/releases/download/v#{version}/assam-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d746ef7ced522ebe4434c8527572eff152350d02c04021b9b3a523ad6aa002a4"
    else
      odie "assam is only available for x86_64 architecture on Linux"
    end
  end

  def install
    bin.install "assam"
    generate_completions_from_executable(bin/"assam", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/assam --version", 2)
  end
end
