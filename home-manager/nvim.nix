{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {

  imports = [
    inputs.base16.nixosModule
    { scheme = "${inputs.tt-schemes}/base16/dracula.yaml"; }
  ];

  programs.nvf = {
    enable = true;
    # your settings need to go into the settings attribute set
    # most settings are documented in the appendix
    settings = {
      vim.viAlias = true;
      vim.vimAlias = true;

      vim.globals = {
        mapleader = " ";
        maplocalleader = " ";
      };

      vim.lineNumberMode = "relNumber";
      vim.undoFile.enable = true;
      vim.options.updatetime = 250;
      vim.options.tm = 300;

      vim.lsp = {
        enable = true;
      };
      vim.languages.rust.enable = true;
      vim.languages.rust.lsp.enable = true;
      vim.languages.nix.enable = true;
      vim.languages.enableLSP = true;
      vim.languages.enableTreesitter = true;

      vim.theme = {
        enable = true;
        name = "base16";
        style = "dark";
        transparent = false;
        base16-colors = with config.scheme.withHashtag; {
          base00 = base00;
          base01 = base01;
          base02 = base02;
          base03 = base03;
          base04 = base04;
          base05 = base05;
          base06 = base06;
          base07 = base07;
          base08 = base08;
          base09 = base09;
          base0A = base0A;
          base0B = base0B;
          base0C = base0C;
          base0D = base0D;
          base0E = base0E;
          base0F = base0F;
          #base0G = base0G;
        };
      };

      #vim.startPlugins = ["fneu-breezy"];
    };
  };
}
