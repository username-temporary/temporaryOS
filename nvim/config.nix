{pkgs,lib,...}:
{
  vim={
    statusline.lualine.enable=true;
    telescope.enable=true;
 
    
    languages={
      enableLSP=true;
      enableTreesitter=true;
      nix.enable=true;
      
    };
 
 };

}
