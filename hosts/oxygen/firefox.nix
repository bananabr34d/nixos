{ config, pkgs, ... }:

let
  hardenedFirefox = pkgs.wrapFirefox pkgs.firefox-esr-unwrapped {
    nixExtensions = with pkgs; [
      (fetchFirefoxAddon {
        name = "darkreader";
        url = "https://addons.mozilla.org/firefox/downloads/file/4053589/darkreader-4.9.62.xpi";
        sha256 = "sha256-5TeizuRe18JveezT7TYmIOPwDSTBWFMqWOFjpjo9YMw=";
      })
      (fetchFirefoxAddon {
        name = "ublock";
        url = "https://addons.mozilla.org/firefox/downloads/file/4141256/ublock_origin-1.51.0.xpi";
        sha256 = "0n3qdsba9sdn3lfk23z3gz9fghjfsyb8qr09zim62x5sb23nqnm3";
      })
      (fetchFirefoxAddon {
        name = "bitwarden";
        url = "https://addons.mozilla.org/firefox/downloads/file/4071765/bitwarden_password_manager-2023.2.1.xpi";
        sha256 = "09nhiz665xg8gy0c72mkm19c35baim2ff9717v7svh9r3xgnwbi8";
      })

    ];

    extraPolicies = {
      CaptivePortal = false;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DisableFirefoxAccounts = true;
      FirefoxHome = {
        Pocket = false;
        Snippets = false;
      };
      UserMessaging = {
        ExtensionRecommendations = false;
        SkipOnboarding = true;
      };
    };

    extraPrefs = ''
      // Show more ssl cert infos
      lockPref("security.identityblock.show_extended_validation", true);

      // Enable userchrome css
      lockPref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

      // Enable dark dev tools
      lockPref("devtools.theme","dark");

      // Disable js in PDFs
      lockPref("pdfjs.enableScripting", false);
    '';

  };

in
{

  environment.variables = {
    BROWSER = [ "firefox" ];
  };

  environment.systemPackages = with pkgs; [
    hardenedFirefox
  ];

}
