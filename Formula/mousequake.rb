class Mousequake < Formula
  desc "Simple tool for automatically shaking the mouse pointer"
  homepage "https://github.com/KanchiShimono/mousequake"
  version "0.0.6"
  license ""

  on_macos do
    on_intel do
      url "https://github.com/KanchiShimono/mousequake/releases/download/v#{version}/mousequake-x86_64-apple-darwin.tar.gz"
      sha256 "8546fbf75813d967616948d3cf365df22d4ccf6f806a6e4c1bf51749e2e5018c"
    end
    on_arm do
      url "https://github.com/KanchiShimono/mousequake/releases/download/v#{version}/mousequake-aarch64-apple-darwin.tar.gz"
      sha256 "7e949caf407260ec8f081a092301febf2211e2936c57c78c54f4c09bc5d7c6cd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/KanchiShimono/mousequake/releases/download/v#{version}/mousequake-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f153c59df2400a40977ac883d34a163fdf9b3ed71da2184de2156a5e81fc769b"
    end
  end

  def install
    bin.install "mousequake"
    generate_completions_from_executable(bin/"mousequake", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mousequake --version")
  end
end
