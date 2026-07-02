class Airbank < Formula
  include Language::Python::Virtualenv

  desc "Airbank by Finsider - the AI-native investment bank that lives in your terminal"
  homepage "https://github.com/dm3n/airbank-fund"
  url "https://github.com/dm3n/airbank-fund/archive/refs/tags/v3.0.0.tar.gz"
  sha256 "e8d0d76289eda0a15426b616735633ba64b99a8a47dfbf85beaea16bf24d13f3"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      Get a fund running in sixty seconds:
        airbank init
        airbank backtest
        airbank start
        airbank watch

      Live trading requires per-trade approval by design. Read the spec:
        airbank contract
    EOS
  end

  test do
    assert_match "airbank 3.0.0", shell_output("#{bin}/airbank version")
  end
end
