{
  pkgs ? import <nixpkgs> { },
  awesome-yasunori ? builtins.fetchTarball "https://github.com/takeokunn/awesome-yasunori/archive/main.tar.gz",
}:
rec {
  kuusay = pkgs.callPackage ./packages/kuusay { cowsay = pkgs.neo-cowsay; };
  default = kuusay;
  remark-cli = pkgs.callPackage ./packages/remark-cli { };
  yasunori-cli = pkgs.callPackage ./packages/yasunori-cli {
    inherit awesome-yasunori;
    inherit remark-cli;
  };
}
