{
  description = "Python Crash Course Dev Environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      pythonEnv = pkgs.python3.withPackages(ps: with ps; [
        ruff
        pygame
        matplotlib
        plotly
        requests
        django
        pytest
        django-bootstrap5
      ]);
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = [ pythonEnv ];

        shellHook = ''
          echo "🐍 Python Crash Course environment activated!"
          echo "Python version: $(python --version)"
        '';
      };
    };
}
