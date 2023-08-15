{ pkgs, ... }:
{
  # Home Manager programs.firefox style
  programs.firefox = {
    enable = true;
    profiles = {
      joe = {
        isDefault = true;
        settings = {
          "beacon.enabled" = false;
          "browser.contentblocking.category" = "strict";
          "browser.display.background_color" = "#F9FAFB";
          "browser.display.foreground_color" = "#111827";
          "browser.display.os-zoom-behavior" = 1;
#          "browser.download.dir" = "${config.home.homeDirectory}/download";
          "browser.newtabpage.enabled" = false; # Blank new tab page.
          "browser.safebrowsing.appRepURL" = "";
          "browser.safebrowsing.malware.enabled" = false;
          "browser.search.hiddenOneOffs" =
            "Google,Yahoo,Bing,Amazon.com,Twitter";
          "browser.search.suggest.enabled" = false;
          "browser.send_pings" = false;
          "browser.startup.page" = 3; # Resume last session.
          "browser.tabs.closeWindowWithLastTab" = false;
          "browser.uidensity" = 1; # Dense.
          "browser.urlbar.placeholderName" = "DuckDuckGo";
          "browser.urlbar.speculativeConnect.enabled" = false;
#          "devtools.theme" = "${config.theme.base16.kind}";
          "dom.battery.enabled" = false;
          "dom.security.https_only_mode" = true;
          "experiments.activeExperiment" = false;
          "experiments.enabled" = false;
          "experiments.supported" = false;
          "extensions.unifiedExtensions.enabled" = false;
          "general.smoothScroll" = false;
          "geo.enabled" = false;
          "gfx.webrender.all" = true; "layout.css.devPixelsPerPx" = 1;
          # Follow system color theme.
          "layout.css.prefers-color-scheme.content-override" = 2;
          "media.ffmpeg.vaapi.enabled" = true;
          "media.navigator.enabled" = false;
          "media.video_stats.enabled" = false;
          "network.IDN_show_punycode" = true;
          "network.allow-experiments" = false;
          "network.dns.disablePrefetch" = true;
          "network.http.referer.XOriginPolicy" = 2;
          "network.http.referer.XOriginTrimmingPolicy" = 2;
          "network.http.referer.trimmingPolicy" = 1;
          "network.prefetch-next" = false;
          "permissions.default.shortcuts" = 2; # Don't steal my shortcuts!
          "privacy.donottrackheader.enabled" = true;
          "privacy.donottrackheader.value" = 1;
          "privacy.firstparty.isolate" = true;
          "signon.rememberSignons" = false;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "ui.textScaleFactor" = 100;
          "widget.content.gtk-theme-override" = "Adwaita:light";

          # Fully disable Pocket. See
          # https://www.reddit.com/r/linux/comments/zabm2a.
          "extensions.pocket.enabled" = false;
          "extensions.pocket.api" = "0.0.0.0";
          "extensions.pocket.loggedOutVariant" = "";
          "extensions.pocket.oAuthConsumerKey" = "";
          "extensions.pocket.onSaveRecs" = false;
          "extensions.pocket.onSaveRecs.locales" = "";
          "extensions.pocket.showHome" = false;
          "extensions.pocket.site" = "0.0.0.0";
          "browser.newtabpage.activity-stream.pocketCta" = "";
          "browser.newtabpage.activity-stream.section.highlights.includePocket" =
            false;
          "services.sync.prefs.sync.browser.newtabpage.activity-stream.section.highlights.includePocket" =
            false;
        };

        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          # anchors-reveal
          auto-tab-discard
          bitwarden
          browserpass
         # bypass-paywalls-clean
          cookie-autodelete
          darkreader
          form-history-control
          libredirect
          link-cleaner
          # linkhints
          multi-account-containers
          offline-qr-code-generator
          # reddit-enhancement-suite
          skip-redirect
          tree-style-tab
          # tst-tab-search
          ublock-origin
          vimium
        ];

        userChrome = ''
          @namespace url("http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul");

          #TabsToolbar {
            visibility: collapse;
          }

          #titlebar {
            display: none;
          }

          #sidebar-header {
            display: none;
          }
        '';

#        userContent = ''
#          @-moz-document url(about:home), url(about:newtab) {
#            body {
#              --newtab-background-color: ${rgbI colors.base00};
#              --newtab-element-hover-color: ${rgbI colors.base01};
#              --newtab-icon-primary-color: ${rgbaI colors.base04 0.4};
#              --newtab-search-border-color: ${rgbaI colors.base01 0.2};
#              --newtab-search-dropdown-color: ${rgbI colors.base00};
#              --newtab-search-dropdown-header-color: ${rgbI colors.base00};
#              --newtab-search-icon-color: ${rgbaI colors.base04 0.4};
#              --newtab-section-header-text-color: ${rgbI colors.base05};
#              --newtab-snippets-background-color: ${rgbI colors.base01};
#              --newtab-text-primary-color: ${rgbI colors.base05};
#              --newtab-textbox-background-color: ${rgbI colors.base01};
#              --newtab-textbox-border: ${rgbaI colors.base01 0.2};
#              --newtab-topsites-background-color: ${rgbI colors.base04};
#              --newtab-topsites-label-color: ${rgbI colors.base05};
#            }
#          }
#        '';
      };
    };
  };

#   programs = {
#     firefox = {
#       enable = true;
#       profiles.default = {
#         id = 0;
#         name = "Default";
#         isDefault = true;
#         extensions = with pkgs.nur.repos.rycee.firefox-addons; [
#           multi-account-containers
#           ublock-origin
#           vimium
#           bitwarden
#         ];
#       };
#     };
#   };
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
