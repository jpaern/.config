{
  programs.vim = {
    enable = true;
    settings = {
      history    = 1000;
      hidden     = true;
      number     = true;
      tabstop    = 4;
      shiftwidth = 4;
    }; 
    plugins = [
      "ale"
      "nerdtree"
      "tagbar"
      "vim-buffergator"
      "vim-bufferline"
      "vim-colors-solarized"
      "vim-fugitive"
      "vim-gitgutter"
      "vim-airline"
      "YouCompleteMe"
    ];
    extraConfig = ''
      " Airline config, start
      let g:airline#extions#tabline#enabled = 1
      let g:airline_powerline_fonts = 1
      " Airline config, end

      " solarized config, start
      if has('gui_running')
        set background=dark
        colorscheme solarized
        set guioptions+=e
        set guioptions+=gtrLme
      else
        set background=dark
      end
      " solarized config, end

      set nowrap
      set ai
      set showmatch
      set textwidth=0
      set hlsearch
      set norelativenumber

      " YouCompleteMe config, start
      " let g:ycm_add_preview_to_completeopt=0
      " let g:ycm_confirm_extra_conf=0
      " YouCompleteMe config, end

      " Syntastic config, start
      set statusline+=%#warningmsg#
      set statusline+=%{SyntasticStatuslineFlag()}
      set statusline+=%*

      let g:syntastic_always_populate_loc_list = 1
      let g:syntastic_auto_loc_list = 1
      let g:syntastic_check_on_open = 1
      let g:syntastic_check_on_wq = 0
      " Syntastic config, end

      set hidden
      set colorcolumn=80 
    '';
  };
}
