class Forge < Formula
  desc "Continuous Delivery friendly CloudFormation deployment tool"
  homepage "https://github.com/nathandines/forge"
  url "https://github.com/nathandines/forge/archive/v2.2.5.tar.gz"
  sha256 "a3d909c9f004eec2c7d20df7730a84781425969461141efe9f14f72c2f85bb9d"

  bottle :unneeded

  depends_on "go" => :build

  def install
    system "make", "build"

    bin.mkpath
    bin.install "bin/forge"

    (bash_completion/"forge").write(`#{bin}/forge gen-bash-completion`)
    (zsh_completion/"forge").write(`#{bin}/forge gen-zsh-completion`)

    prefix.install_metafiles
  end

  test do
    system bin/"forge", "--version"
  end
end
