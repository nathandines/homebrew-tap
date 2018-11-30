class Forge < Formula
  desc "Continuous Delivery friendly CloudFormation deployment tool"
  homepage "https://github.com/nathandines/forge"
  url "https://github.com/nathandines/forge/releases/download/v2.2.5/forge_v2.2.5_darwin_amd64"
  version "2.2.5"
  sha256 "88c178bafc330b573547dceaf1d8a9e8c17a7e56eaf2fdef4cbfdce21ced6e00"

  bottle :unneeded

  def install
    bin.mkpath
    bin.install "forge_v2.2.5_darwin_amd64"
    mv bin/"forge_v2.2.5_darwin_amd64", bin/"forge"

    (bash_completion/"forge").write(bin/"forge gen-bash-completion")
    (zsh_completion/"forge").write(bin/"forge gen-zsh-completion")

    prefix.install_metafiles
  end

  test do
    system bin/"forge", "--version"
  end
end
