{ pkgs, ... }:
{
  # Home Manager programs.firefox style
  programs = {
    firefox = {
      enable = true;
      profiles.default = {
        id = 0;
        name = "Default";
        isDefault = true;
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          multi-account-containers
          ublock-origin
          vimium
          bitwarden
        ];
      };
    };
  };
#    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
#      extraPolicies = {
#        CaptivePortal = false;
#        DisableFirefoxStudies = true;
#        DisablePocket = true;
#        DisableTelemetry = true;
#        DisableFirefoxAccounts = true;
#        FirefoxHome = {
#          Pocket = false;
#          Snippets = false;
#        };
#        UserMessaging = {
#          ExtensionRecommendations = false;
#          SkipOnboarding = true;
#        };
#      };
#      extraPolicies = {
#        ExtensionSettings = {};
#      };
#    };
#  };
}
