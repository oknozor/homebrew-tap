class UnveilRs < Formula
  desc "Unveil Rs is a tool to create presentations from markdown inspired by reveal.js, mdbook and zola"
  homepage "https://oknozor.github.io/unveil-rs/"
  version "0.1.2-alpha1"
  license "MIT"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/oknozor/unveil-rs/releases/download/0.1.2-alpha1/unveil-0.1.2-alpha1-x86_64-apple-darwin.tar.gz"
    sha256 "4cbf7bdc4df06bef3e16bafbd15e0fdc25b1c907a5ee4edf37f8d2a8d3d57b24"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/oknozor/unveil-rs/releases/download/0.1.2-alpha1/unveil-0.1.2-alpha1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "271a12d7442a65f60750a330f78d5daef8e8c42003d5f28fffd9b88e53f90876"
    end
  end

  def install
    bin.install "unveil"
  end

  test do
    system bin/"unveil", "init", "test"
    assert_predicate testpath/"test/unveil.toml", :exist?
    assert_predicate testpath/"test/slides/landig.md", :exist?
  end
end
