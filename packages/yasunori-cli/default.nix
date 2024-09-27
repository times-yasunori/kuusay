{
  runCommand,
  writers,
  awesome-yasunori,
  remark-cli,
}:
let
  yasunori-json = runCommand "yasunori.json" { nativeBuildInputs = [ remark-cli ]; } ''
    remark-cli ${awesome-yasunori}/README.md --tree-out > $out
  '';
in

writers.writeNu "yasunori-cli" ''
  open ${yasunori-json} | get children | where $it.type == "code" | get value | get (random dice --sides (($in | length) - 1) | get 0)
''
