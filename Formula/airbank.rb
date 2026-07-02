class Airbank < Formula
  include Language::Python::Virtualenv

  desc "Airbank by Finsider - the AI-native hedge fund that lives in your terminal"
  homepage "https://github.com/dm3n/airbank-fund"
  url "https://github.com/dm3n/airbank-fund/archive/refs/tags/v2.4.0.tar.gz"
  sha256 "83f8d8c096fc909cc6c64310519402323cec22c5571bfd764f2d9e13011e52b7"
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
    assert_match "airbank 2.4.0", shell_output("#{bin}/airbank version")
  end
end
