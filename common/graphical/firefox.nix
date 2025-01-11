{ config, lib, pkgs, modulesPath, ... }:
{
  # Install firefox.
  programs.firefox = {
    enable = true;
    languagePacks = ["fr"];
    preferences = {
      "intl.accept_languages" = "fr, fr-fr, en-us, en";
      "intl.locale.requested" = "fr";
      "browser.translations.neverTranslateLanguages" = "fr,en";
    };
    policies = {
      DisplayBookmarksToolbar = "always";
      ExtensionSettings = {
        "*".installation_mode = "blocked"; # blocks all addons except the ones specified below
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };
  };
}
