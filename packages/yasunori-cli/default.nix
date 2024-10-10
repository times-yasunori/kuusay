{
  runCommand,
  writers,
  awesome-yasunori,
  yj,
}:
let
  yasunori-json = runCommand "yasunori.json" { nativeBuildInputs = [ yj ]; } ''
    yj -tj < ${awesome-yasunori}/yasunori.toml > $out
  '';
in

writers.writeNu "yasunori-cli" ''
    open ${yasunori-json} | get yasunori | get content | get (random dice --sides (($in | length) - 1) | get 0)
''
