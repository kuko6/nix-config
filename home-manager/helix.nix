{
  pkgs,
  config,
  ... 
}: {
  enable = true;
  settings = {
    theme = "catppuccin_macchiato";

    editor = {
      bufferline = "multiple"; 
      soft-wrap.enable = true;
    
      statusline = {
        left = ["mode" "spinner" "version-control"]; 
        center = ["file-name"]; 
        right = ["diagnostics" "position" "total-line-numbers" "file-encoding" "file-line-ending" "file-type"]; 
        separator = "│"; 
        mode.normal = "NORMAL";
        mode.insert = "INSERT"; 
        mode.select = "SELECT"; 
      };

      cursor-shape = {
        insert = "bar"; 
        normal = "block"; 
        select = "underline";
        # character = "|" 
      };

      indent-guides.render = true;
      
      # line-number = "relative";
      lsp.display-messages = true;
    };
  };
  languages = {  
    language = [{
      name = "typescript";
      shebangs = ["deno"];
      roots = ["deno.json" "deno.jsonc" "package.json"];
      file-types = ["js" "ts" "jsx" "tsx"];
      auto-format = false;
      language-servers = ["deno-lsp"];
    } {
      name = "python";
      language-servers = [ "pyright" "ruff" ];
    } {
      name = "go";
      auto-format = false;
      formatter = { command = "goimports"; };
    } {
      name = "html";
      language-servers = [ "vscode-html-language-server" "tailwindcss-ls" ];
    } {
      name = "css";
      language-servers = [ "vscode-css-language-server" "tailwindcss-ls" ];
    } {
      name = "jsx";
      language-servers = [ "typescript-language-server" "tailwindcss-ls" ];
    } {  
      name = "tsx";
      language-servers = [ "typescript-language-server" "tailwindcss-ls" ];
    } {
      name = "svelte";
      language-servers = [ "svelteserver" "tailwindcss-ls" ];
    }];
  };
}
