{
  lib,
  stdenv,
  makeWrapper,
  cowsay,
}:

let
  pname = "nikuussay";
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
    makeWrapper ${lib.getExe cowsay} $out/bin/nikuussay \
      --set COWPATH $src \
      --add-flags "-f nikuus"

    runHook postInstall
  '';

  meta.mainProgram = pname;

})
