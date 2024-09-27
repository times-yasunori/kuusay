{
  writeShellApplication,
  kuusay,
  yasunori-cli,
}:
writeShellApplication {
  name = "kuusay-yasunori";
  runtimeInputs = [ kuusay ];
  text = ''
    ${yasunori-cli} | kuusay
  '';
}
