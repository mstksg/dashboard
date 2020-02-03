let types = ../types.dhall

let buttons = ./buttons/package.dhall

let text =
      https://raw.githubusercontent.com/dhall-lang/dhall-lang/v13.0.0/Prelude/Text/package.dhall sha256:0a0ad9f649aed94c2680491efb384925b5b2bb5b353f1b8a7eb134955c1ffe45

let optional =
      https://raw.githubusercontent.com/dhall-lang/dhall-lang/v13.0.0/Prelude/Optional/package.dhall sha256:7608f2d38dabee8bfe6865b4adc11289059984220f422d2b023b15b3908f7a4c

let isPublished =
        λ(s : types.Status)
      → merge
          { Incomplete = False
          , Unpublished = False
          , Published = True
          , Unmaintained = True
          , Deprecated = True
          }
          s

in    λ(p : types.HaskellPackage)
    → let gh = ./package-github.dhall p

      in  text.concatMapSep
            "\n\n"
            (List types.Button)
            (text.concatMapSep "\n" types.Button ./render-button.dhall)
            [   [ buttons.github-button gh ]
              # (       if isPublished p.status

                  then  [ buttons.hackage-button p.name
                        , buttons.stackage-button
                            p.name
                            types.StackageResolver.LTS
                        , buttons.stackage-button
                            p.name
                            types.StackageResolver.Nightly
                        ]

                  else  [] : List types.Button
                )
            , [ buttons.issues-button gh
              , buttons.pr-button gh
              , buttons.travis-button gh
              ]
            ]
