{
  pkgs ? import <nixpkgs> { },
}:
rec {
  kuusay = pkgs.callPackage ./packages/kuusay { cowsay = pkgs.neo-cowsay; };
  default = kuusay;
  remark-cli = pkgs.callPackage ./packages/remark-cli { };
}
