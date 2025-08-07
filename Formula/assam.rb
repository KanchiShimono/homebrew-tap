class Assam < Formula
  version "0.0.1-alpha.1"
  desc "AWS SAML authentication CLI tool for Azure Entra ID"
  homepage "https://github.com/KanchiShimono/assam-rs"
  license ""

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/KanchiShimono/assam-rs/releases/download/v#{version}/assam-x86_64-apple-darwin.tar.gz"
      sha256 "dbf3ac6d5a18187b06ebd4b520fc25e7d84061c0a4f4c040782d3f70abefd7ac"
    elsif Hardware::CPU.arm?
      url "https://github.com/KanchiShimono/assam-rs/releases/download/v#{version}/assam-aarch64-apple-darwin.tar.gz"
      sha256 "35a24279cf52656b036ca0e50d36c0750b6506ff5e7f7944559208818eb8c55b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/KanchiShimono/assam-rs/releases/download/v#{version}/assam-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9661e72592795b5fe8a4a99e9e3ea945eec6ef0c3a7e8e151af8d3516dfc69ec"
    else
      odie "assam is only available for x86_64 architecture on Linux"
    end
  end

  def install
    bin.install "assam"
    generate_completions_from_executable(bin/"assam", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/assam --version", 2)
  end
end
