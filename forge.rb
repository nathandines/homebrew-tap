class Forge < Formula
  desc "Continuous Delivery friendly CloudFormation deployment tool"
  homepage "https://github.com/nathandines/forge"
  url "https://github.com/nathandines/forge/archive/v2.2.4.tar.gz"
  sha256 "adb8c1d9f55ca21cec9bf2397898d37e4eb1e2e17fad9f06eca137c1d95da08d"

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
