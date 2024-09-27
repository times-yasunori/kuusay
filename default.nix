{
  pkgs ? import <nixpkgs> { },
}:
let
  inherit (pkgs)
    stdenv
    lib
    makeWrapper
    neo-cowsay
    ;
in

stdenv.mkDerivation (finalAttrs: {
  pname = "kuusay";
  version = "1.0.0";

  src = lib.cleanSource ./.;

  nativeBuildInputs = [ makeWrapper ];

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    makeWrapper ${lib.getExe neo-cowsay} $out/bin/kuusay \
      --set COWPATH $src \
      --add-flags "-f kuu"

    runHook postInstall
  '';

})
