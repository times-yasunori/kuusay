{
  lib,
  writeShellApplication,
  cowsay,
  yasunori-cli,
}:
writeShellApplication {
  name = "${cowsay.pname}-yasunori";
  text = ''
    ${yasunori-cli} | ${lib.getExe cowsay}
  '';
}
