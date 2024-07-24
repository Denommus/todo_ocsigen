{ ocamlPackages, postgresql }:
ocamlPackages.buildDunePackage {
  pname = "todo_ocsigen";
  version = "0.1";

  src = ./.;

  duneVersion = "3";

  buildInputs = [
    ocamlPackages.lwt
    ocamlPackages.tyxml
    ocamlPackages.eliom
    ocamlPackages.ocsipersist
  ];

  nativeBuildInputs = [
    ocamlPackages.js_of_ocaml
    postgresql
  ];

  propagatedBuildInputs = [
    ocamlPackages.ocsipersist-sqlite
  ];
}
