{ buildNpmPackage }:
buildNpmPackage {
  pname = "remark-cli";
  version = "12.0.1";
  src = ./.;
  npmDepsHash = "sha256-4N6//wmPmIaVYT0s1AkAsWfrHwq9w7k86zy1YwtXifI=";

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/{bin,lib/node_modules}
    cp -r node_modules $out/lib
    ln -s $out/lib/node_modules/remark-cli/cli.js $out/bin/remark-cli

    runHook postInstall
  '';
}
