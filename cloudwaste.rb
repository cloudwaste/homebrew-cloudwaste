# This is an auto-generated file. DO NOT EDIT
class Cloudwaste < Formula
    desc "Find wasted resources in your cloud 💸"
    homepage "https://github.com/cloudwaste/cloudwaste"
    baseurl = "https://github.com/cloudwaste/cloudwaste/releases/download"
    version "0.3.0"
    bottle :unneeded
    if OS.mac?
      kernel = "mac"
      sha256 "cfd29714528b88758ff6a187d2c89ac829fbd9bac07279c0c01da31bb3512fc0"
    elsif OS.linux?
      kernel = "linux"
      sha256 "ebc34cd889dc32a09cb39f623b284a8d75601712edd36dfaab0614c78bde90c3"
    end
    @@bin_name = "cloudwaste_0.3.0_" + kernel + "_amd64.tar.gz"
    url baseurl + "/v0.3.0/" + @@bin_name
    def install
      bin.install "cloudwaste"
    end
end
