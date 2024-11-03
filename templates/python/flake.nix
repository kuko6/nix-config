{
  description = "Simple Python development environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";  
  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
        pkgs = import nixpkgs { inherit system; };
      });
    in
    {
      devShells = forEachSupportedSystem ({ pkgs }: {
        default = pkgs.mkShell {
          venvDir = ".venv";
          packages = with pkgs; [ python3 ] ++
            (with pkgs.python3Packages; [
              pip
              venvShellHook
              ruff
              pyright
            ]) ++
            [
              gcc
              binutils
              libtool 
              automake
              autoconf 
              make 
              libffi 
              openssl
              zlib 
              libxml2 
              libxslt
              bzip2 
              xz 
              cmake 
              ninja
            ];
          shellHook = ''
            export LD_LIBRARY_PATH=${pkgs.lib.makeLibraryPath [
              pkgs.gcc
              pkgs.binutils
              pkgs.libtool
              pkgs.automake
              pkgs.autoconf
              pkgs.make
              pkgs.libffi
              pkgs.openssl
              pkgs.zlib
              pkgs.libxslt
              pkgs.bzip2
              pkgs.xz
              pkgs.cmake
              pkgs.ninja
            ]}:$LD_LIBRARY_PATH
          '';
        };
      });
    };
}
