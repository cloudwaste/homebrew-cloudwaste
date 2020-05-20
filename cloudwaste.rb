# This is an auto-generated file. DO NOT EDIT
class Cloudwaste < Formula
    desc "Find wasted resources in your cloud 💸"
    homepage "https://github.com/cloudwaste/cloudwaste"
    baseurl = "https://github.com/cloudwaste/cloudwaste/releases/download"
    version "0.4.0"
    bottle :unneeded
    if OS.mac?
      kernel = "mac"
      sha256 "3ef94cb0a5001f63398ae0e7b3b80610f2333fd036b954a2afcedeb3cedb5387"
    elsif OS.linux?
      kernel = "linux"
      sha256 "1bcd7d29d28366cf9b692d65bb7f2f496f03cbcf42a71a0ac8f24e901e676a0b"
    end
    @@bin_name = "cloudwaste_0.4.0_" + kernel + "_amd64.tar.gz"
    url baseurl + "/v0.4.0/" + @@bin_name
    def install
      bin.install "cloudwaste"
    end
end
