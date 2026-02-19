{pkgs,lib,inputs,...}:
{
  programs.nvf={
    enable=true;
    settings.vim={
      statusline.lualine.enable=true;
      telescope.enable=true;
   
      
      lsp.enable=true;
      languages={
        enableTreesitter=true;
        nix.enable=true;
        
      };
   
    };

  };
}
