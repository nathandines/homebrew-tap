class Forge < Formula
  desc "Continuous Delivery friendly CloudFormation deployment tool"
  homepage "https://github.com/nathandines/forge"
  url "https://github.com/nathandines/forge/archive/v2.2.2.tar.gz"
  sha256 "7175d895db007831966e6f36a14e5868e3db14c08313dd88cbad8a610e5b35a5"

  bottle :unneeded

  depends_on "dep" => :build
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    src_path = buildpath/"src/github.com/nathandines/forge"
    src_path.install Dir["*"]

    cd src_path do
      system "make", "deps"
      system "make"
      bin.install "bin/forge"
      system bin/"forge", "gen-bash-completion", ">", bash_completion/"forge"
      system bin/"forge", "gen-zsh-completion", ">", zsh_completion/"forge"
      prefix.install_metafiles
    end
  end

  test do
    system bin/"forge", "--version"
  end
end
