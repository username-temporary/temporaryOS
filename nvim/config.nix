{pkgs,lib,inputs,...}:
{
  programs.nvf={
    enable=true;
    settings.vim={
      statusline.lualine.enable = true;
      telescope.enable = true;
      options = {
        autoindent = true;
        smartindent = true;

        tabstop = 2;
        shiftwidth = 2;
        softtabstop = 2;
        expandtab = true;
      };
      lsp.enable=true;
      languages={
        enableTreesitter = true;
        nix.enable = true;
        
      };
 
    };
  };
}
