let types = ../types.dhall

let buttons = ./buttons/package.dhall

let text =
      https://raw.githubusercontent.com/dhall-lang/dhall-lang/v20.0.0/Prelude/Text/package.dhall sha256:46c53957c10bd4c332a5716d6e06068cd24ae1392ca171e6da31e30b9b33c07c

let optional =
      https://raw.githubusercontent.com/dhall-lang/dhall-lang/v20.0.0/Prelude/Optional/package.dhall sha256:37b84d6fe94c591d603d7b06527a2d3439ba83361e9326bc7b72517c7dc54d4e

in  λ(p : types.HaskellPackage) →
      let gh = ./package-github.dhall p

      in  text.concatMapSep
            "\n\n"
            (List types.Button)
            (text.concatMapSep "\n" types.Button ./render/render-button.dhall)
            [   [ buttons.github-button gh ]
              # ( if    ./on-hackage.dhall p.status
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
              , buttons.last-commit-button gh
              , buttons.travis-button gh
              ]
            ]
