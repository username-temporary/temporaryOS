{pkgs,lib,inputs,...}:
{
  programs.nvf={
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
