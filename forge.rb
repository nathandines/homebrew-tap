class Forge < Formula
  desc "Continuous Delivery friendly CloudFormation deployment tool"
  homepage "https://github.com/nathandines/forge"
  url "https://github.com/nathandines/forge/archive/v2.2.3.tar.gz"
  sha256 "e67e7588048e893926f901c6c579a524f88f2252f977dc335cc0d0734c7e81e3"

  bottle :unneeded

  depends_on "dep" => :build
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    src_path = buildpath/"src/github.com/nathandines/forge"
    src_path.install Dir["*"]

    cd src_path do
      system "make", "deps"
      system "make", "build"
      bin.mkpath
      bin.install "bin/forge"
    end
    (bash_completion/"forge").write(`#{bin}/forge gen-bash-completion`)
    (zsh_completion/"forge").write(`#{bin}/forge gen-zsh-completion`)
    prefix.install_metafiles
  end

  test do
    system bin/"forge", "--version"
  end
end
