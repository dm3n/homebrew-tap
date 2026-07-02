class Airbank < Formula
  include Language::Python::Virtualenv

  desc "Airbank by Finsider - the AI-native hedge fund that lives in your terminal"
  homepage "https://github.com/dm3n/airbank-fund"
  url "https://github.com/dm3n/airbank-fund/archive/refs/tags/v2.2.0.tar.gz"
  sha256 "6ad107d0352c196c704e29ff88b28efa612383b6462065abe17848ecd080345b"
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
    assert_match "airbank 2.2.0", shell_output("#{bin}/airbank version")
  end
end
