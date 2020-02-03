let types = ./dhall/types.dhall

let helpers = ./dhall/helpers/package.dhall

let text =
      https://raw.githubusercontent.com/dhall-lang/dhall-lang/v13.0.0/Prelude/Text/package.dhall sha256:0a0ad9f649aed94c2680491efb384925b5b2bb5b353f1b8a7eb134955c1ffe45

let haskellProjects =
      text.concatMapSep
        "\n\n\n"
        types.HaskellPackage
        helpers.render.render-package
        ./content/haskell-packages.dhall

in  ''
    Dashboard
    =========

    A dashboard of my OSS projects and their statuses.  Mostly for my own
    self-reference.

    Rendered using [dhall](http://dhall-lang.org/):

    ```
    dhall text --file render.dhall > README.md
    ```


    Haskell
    -------

    ${haskellProjects}

    ''
