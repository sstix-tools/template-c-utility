{
  description = "template-c-utility - Template for compiled C CLI utilities";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }:
    let
      systems = [
        "aarch64-darwin"
        "x86_64-darwin"
        "x86_64-linux"
        "aarch64-linux"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system nixpkgs.legacyPackages.${system});
    in
    {
      packages = forAllSystems (system: pkgs: rec {
        default = template-c-utility;
        template-c-utility = pkgs.stdenv.mkDerivation {
          pname = "template-c-utility";
          version = "1.0.0";
          src = ./.;

          installPhase = ''
            mkdir -p $out/bin $out/share/zsh/site-functions
            make install PREFIX=$out
            if [ -d completion ]; then
              cp -r completion/* $out/share/zsh/site-functions/ 2>/dev/null || true
            fi
          '';

          meta = {
            description = "Template compiled C command-line utility";
            mainProgram = "template-c-utility";
            platforms = pkgs.lib.platforms.unix;
          };
        };
      });

      apps = forAllSystems (system: pkgs: {
        default = {
          type = "app";
          program = "${self.packages.${system}.default}/bin/template-c-utility";
        };
      });
    };
}
