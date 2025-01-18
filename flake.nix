{
  description = "Salad StoryBook";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        # NOTE:
        # override since `elixir` is defaulting to 1.18 atm, and lexical doesn't support that version yet
        lexical =
          pkgs.lexical.override { elixir = pkgs.beam27Packages.elixir_1_17; };
      in {
        devShells.default = pkgs.mkShell {
          packages = [ lexical ];

          buildInputs = with pkgs; [
            beam27Packages.elixir_1_17
            beam27Packages.erlang
            nodejs_20

            # LSPs
            # lexical
            erlang-ls

            # Tools
            yarn
            # yamllint
            # yaml-language-server
            # shfmt
            # shellcheck
          ];
        };
      });
}
