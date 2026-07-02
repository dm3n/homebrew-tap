class Airbank < Formula
  include Language::Python::Virtualenv

  desc "Airbank by Finsider - the AI-native hedge fund that lives in your terminal"
  homepage "https://github.com/dm3n/airbank-fund"
  url "https://github.com/dm3n/airbank-fund/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "9eb93b0a4eae11307e2ccb7e51fe33aa4c8118dea69ee7945d98ed86168fbb5b"
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
    assert_match "airbank 2.1.0", shell_output("#{bin}/airbank version")
  end
end
