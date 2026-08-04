class Srcmgr < Formula
  desc "Simple repository manager"
  homepage "https://github.com/KanchiShimono/srcmgr"
  version "0.0.2"
  license ""

  on_macos do
    on_intel do
      url "https://github.com/KanchiShimono/srcmgr/releases/download/v#{version}/srcmgr-x86_64-apple-darwin.tar.gz"
      sha256 "50ac7ba06e719af70bd247e8b39acc04e85118f6d335ca9be1b46be0d9e77d26"
    end
    on_arm do
      url "https://github.com/KanchiShimono/srcmgr/releases/download/v#{version}/srcmgr-aarch64-apple-darwin.tar.gz"
      sha256 "5e455c7a910a420c30de5e001b0a1742c393f2d8edbda620966482516a3e9ccf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/KanchiShimono/srcmgr/releases/download/v#{version}/srcmgr-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8e64fa0dcf5405b8f79bb11015b83be41ccfb55c3456b67c7089bbb2ec231350"
    end
  end

  def install
    bin.install "sm"
    generate_completions_from_executable(bin/"sm", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sm --version")
  end
end
