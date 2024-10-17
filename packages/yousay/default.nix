{
  lib,
  stdenv,
  makeWrapper,
  cowsay,
}:

let
  pname = "yousay";
in
stdenv.mkDerivation (finalAttrs: {
  inherit pname;
  version = "1.0.0";

  src = lib.cleanSource ./.;

  nativeBuildInputs = [ makeWrapper ];

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    makeWrapper ${lib.getExe cowsay} $out/bin/yousay \
      --set COWPATH $src \
      --add-flags "-f yousay"

    runHook postInstall
  '';

  meta.mainProgram = pname;

})
