cask 'microsoft-edge-dev' do
  version '82.0.453.2'
  sha256 'aa869a3271d1e164b01b24a260a26526e790d93f52edd4e6acf4920c7582a1a4'

  # officecdn-microsoft-com.akamaized.net was verified as official when first introduced to the cask
  url "https://officecdn-microsoft-com.akamaized.net/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/MicrosoftEdgeDev-#{version}.pkg"
  appcast 'https://macupdater.net/cgi-bin/check_urls/check_url_redirect.cgi?url=https://go.microsoft.com/fwlink/?linkid=2069340'
  name 'Microsoft Edge Dev'
  homepage 'https://www.microsoftedgeinsider.com/'

  auto_updates true

  pkg "MicrosoftEdgeDev-#{version}.pkg"

  uninstall pkgutil: 'com.microsoft.edgemac.Dev',
            rmdir:   '/Library/Application Support/Microsoft'

  zap launchctl: [
                   'com.microsoft.autoupdate.helper',
                   'com.microsoft.update.agent',
                 ],
      pkgutil:   'com.microsoft.package.Microsoft_AutoUpdate.app',
      delete:    '/Library/PrivilegedHelperTools/com.microsoft.autoupdate.helper',
      trash:     [
                   '~/Library/Preferences/com.microsoft.edgemac.Dev.plist',
                   '/Library/Application Support/Microsoft',
                   '~/Library/Application Support/Microsoft Edge Dev',
                 ]
end
