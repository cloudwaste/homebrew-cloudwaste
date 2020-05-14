# This is an auto-generated file. DO NOT EDIT
class Cloudwaste < Formula
    desc "Find wasted resources in your cloud 💸"
    homepage "https://github.com/cloudwaste/cloudwaste"
    baseurl = "https://github.com/cloudwaste/cloudwaste/releases/download"
    version "0.2.0"
    bottle :unneeded
    if OS.mac?
      kernel = "mac"
      sha256 "bd43c6530b1bffabb4dbb8a6da121dbae0645a100124de45ed58b1cd4dee536d"
    elsif OS.linux?
      kernel = "linux"
      sha256 "cb5e58580d1112a6eb99304ee6ab71ad604d8628e206c9f45c66cde7559a6c9d"
    end
    @@bin_name = "cloudwaste_0.2.0_" + kernel + "_amd64.tar.gz"
    url baseurl + "/v0.2.0/" + @@bin_name
    def install
      bin.install "cloudwaste"
    end
end
