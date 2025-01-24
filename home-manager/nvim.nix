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

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      vim-sleuth
      nvim-treesitter.withAllGrammars
      dracula-nvim
      telescope-nvim
      telescope-fzf-native-nvim
      plenary-nvim
      telescope-ui-select-nvim
      lazydev-nvim
      nvim-lspconfig
      harpoon
      undotree
      indent-blankline-nvim
      zenbones-nvim
      lush-nvim
      nerdtree
      vim-one
    ];
  };
}
