class Cocogitto < Formula
  desc "A set of cli tools for the conventional commit and semver specifications"
  homepage "https://github.com/oknozor/cocogitto/"
  version "1.0.0"
  license "MIT"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/oknozor/cocogitto/releases/download/#{version}/cocogitto-#{version}-x86_64-osx.tar.gz"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/oknozor/cocogitto/releases/download/#{version}/cocogitto-#{version}-x86_64-unknown-linux-musl.tar.gz"
    end
  end

  def install
    bin.install "coco"
    bin.install "cog"
  end

  test do
    system bin/"coco", "--help"
    system bin/"cog", "init", "test"
    assert_predicate testpath/"test/cog.toml", :exist?
  end
end
