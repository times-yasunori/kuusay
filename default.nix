{
  pkgs ? import <nixpkgs> { },
  awesome-yasunori ? builtins.fetchTarball "https://github.com/times-yasunori/awesome-yasunori/archive/main.tar.gz",
}:
rec {
  kuusay = pkgs.callPackage ./packages/kuusay { cowsay = pkgs.neo-cowsay; };
  default = kuusay;
  yasunori-cli = pkgs.callPackage ./packages/yasunori-cli {
    inherit awesome-yasunori;
  };
  kuusay-yasunori = pkgs.callPackage ./packages/cowsay-yasunori {
    cowsay = kuusay;
    inherit yasunori-cli;
  };
  cowsay-yasunori = pkgs.callPackage ./packages/cowsay-yasunori {
    cowsay = pkgs.neo-cowsay;
    inherit yasunori-cli;
  };

  yousay = pkgs.callPackage ./packages/yousay { cowsay = pkgs.neo-cowsay; };
  yousay-yasunori = pkgs.callPackage ./packages/cowsay-yasunori {
    cowsay = yousay;
    inherit yasunori-cli;
  };
  nikuussay = pkgs.callPackage ./packages/nikuussay { cowsay = pkgs.neo-cowsay; };
}
