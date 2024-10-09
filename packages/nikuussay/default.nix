{
  lib,
  stdenv,
  makeWrapper,
  cowsay,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "nikuussay";
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

})
