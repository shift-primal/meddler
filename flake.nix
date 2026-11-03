{
    description = ".NET dev shell";

    inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    outputs =
        { nixpkgs, ... }:
        let
            pkgs = nixpkgs.legacyPackages.x86_64-linux;
        in
        {
            devShells.x86_64-linux.default = pkgs.mkShell {
                packages = with pkgs; [
                    dotnetCorePackages.sdk_10_0
                    dotnet-ef
                    omnisharp-roslyn
                    csharpier
                    netcoredbg
                    postgresql
                ];
            };
        };
}
