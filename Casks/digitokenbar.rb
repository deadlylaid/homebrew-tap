cask "digitokenbar" do
  version "0.1.0"
  sha256 "e8609d032b3030fd638f5f2d4f55d3ba8f566097259594c5061987aefc9d8cd2"

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
