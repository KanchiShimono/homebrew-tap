class Assam < Formula
  desc "AWS SAML authentication CLI tool for Azure Entra ID"
  version "0.0.1"
  homepage "https://github.com/KanchiShimono/assam-rs"
  license ""

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/KanchiShimono/assam-rs/releases/download/v#{version}/assam-x86_64-apple-darwin.tar.gz"
      sha256 "01f8240e5d4c9f8a990cee107ebe397dbf8e185d45b91fce82afdbf916c2e88d"
    elsif Hardware::CPU.arm?
      url "https://github.com/KanchiShimono/assam-rs/releases/download/v#{version}/assam-aarch64-apple-darwin.tar.gz"
      sha256 "d2fd2b395c5e48a8370e4a1c584177c925b56a3d57b445ee2255492afbae0635"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/KanchiShimono/assam-rs/releases/download/v#{version}/assam-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1c54d96e2dfa2643971e435c50f736309915a706d201f833f429645c9f054e39"
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
