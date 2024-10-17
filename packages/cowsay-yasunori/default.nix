{
  lib,
  writeShellApplication,
  cowsay,
  yasunori-cli,
}:
writeShellApplication {
  name = "${cowsay.pname}-yasunori";
  text = ''
    ${lib.getExe yasunori-cli} | ${lib.getExe cowsay};
  '';
}
