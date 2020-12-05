let types = ./dhall/types.dhall

let helpers = ./dhall/helpers/package.dhall

let text =
      https://raw.githubusercontent.com/dhall-lang/dhall-lang/v20.0.0/Prelude/Text/package.dhall sha256:46c53957c10bd4c332a5716d6e06068cd24ae1392ca171e6da31e30b9b33c07c

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
