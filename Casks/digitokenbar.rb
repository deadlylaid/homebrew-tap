cask "digitokenbar" do
  version "0.1.3"
  sha256 "c1652350979892f941aa1a14bfb3c9c01f2c27fba180a106eeb1336cbe8864f3"

  url "https://github.com/deadlylaid/DigiTokenBar/releases/download/v#{version}/DigiTokenBar.zip"
  name "DigiTokenBar"
  desc "Menu bar app that raises a Digimon from your AI coding token usage"
  homepage "https://github.com/deadlylaid/DigiTokenBar"

  depends_on macos: :sonoma

  app "DigiTokenBar.app"

  # Not notarized (free fan project): clear the download quarantine so the first open is not blocked.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-cr", "{{appdir}}/DigiTokenBar.app"],
        sudo: false
  end

  zap trash: [
    "~/Library/Application Support/DigiTokenBar",
    "~/Library/Logs/DigiTokenBar.crash.log",
    "~/Library/Logs/DigiTokenBar.log",
    "~/Library/Logs/DigiTokenBar.old.log",
    "~/Library/Logs/DigiTokenBar.running",
    "~/Library/Preferences/io.github.deadlylaid.digitokenbar.plist",
  ]
end
