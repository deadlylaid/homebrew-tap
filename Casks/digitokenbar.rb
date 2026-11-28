cask "digitokenbar" do
  version "0.1.2"
  sha256 "6039c21621a24ad0f9d51488d50f384ccb3c85486eca80dc57beaad451031dc9"

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
