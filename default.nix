{
  pkgs ? import <nixpkgs> { },
}:
rec {
  kuusay = pkgs.callPackage ./packages/kuusay { cowsay = pkgs.neo-cowsay; };
  default = kuusay;
}
