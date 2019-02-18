class Forge < Formula
  desc "Continuous Delivery friendly CloudFormation deployment tool"
  homepage "https://github.com/nathandines/forge"
  url "https://github.com/nathandines/forge/releases/download/v2.3.0/forge_v2.3.0_darwin_amd64"
  version "2.3.0"
  sha256 "2cfdccf06148664f15a8d9b72175cb0cf7bd522fcf71c7516a2da49329b43029"

  bottle :unneeded

  def install
    bin.mkpath
    bin.install "forge_v2.3.0_darwin_amd64"
    mv bin/"forge_v2.3.0_darwin_amd64", bin/"forge"
    chmod 0755, bin/"forge"

    (bash_completion/"forge").write(`#{bin}/forge gen-bash-completion`)
    (zsh_completion/"forge").write(`#{bin}/forge gen-zsh-completion`)

    prefix.install_metafiles
  end

  test do
    system bin/"forge", "--version"
  end
end
