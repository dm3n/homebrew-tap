class Airbank < Formula
  include Language::Python::Virtualenv

  desc "Airbank by Finsider - the AI-native hedge fund that lives in your terminal"
  homepage "https://github.com/dm3n/airbank-fund"
  url "https://github.com/dm3n/airbank-fund/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "9584325f38bc51be721d3fa596568602d27529b3209b703a57046d463b78323f"
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
    assert_match "airbank 1.1.2", shell_output("#{bin}/airbank version")
  end
end
