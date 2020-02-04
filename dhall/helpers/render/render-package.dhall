let types = ../../types.dhall

let text =
      https://raw.githubusercontent.com/dhall-lang/dhall-lang/v13.0.0/Prelude/Text/package.dhall sha256:0a0ad9f649aed94c2680491efb384925b5b2bb5b353f1b8a7eb134955c1ffe45

let optional =
      https://raw.githubusercontent.com/dhall-lang/dhall-lang/v13.0.0/Prelude/Optional/package.dhall sha256:7608f2d38dabee8bfe6865b4adc11289059984220f422d2b023b15b3908f7a4c

let list =
      https://raw.githubusercontent.com/dhall-lang/dhall-lang/v13.0.0/Prelude/List/package.dhall sha256:f0fdab7ab30415c128d89424589c42a15c835338be116fa14484086e4ba118d7

let renderSupport =
        λ(t : Text)
      → λ(v : Optional types.GHCVersion)
      → optional.map
          types.GHCVersion
          Text
          (λ(u : types.GHCVersion) → "* ${t}: ${./render-ghcversion.dhall u}")
          v

let catMaybeSep =
        λ(sep : Text)
      → λ(xs : List (Optional Text))
      → text.concatSep
          sep
          (list.concatMap (Optional Text) Text (optional.toList Text) xs)

in    λ(p : types.HaskellPackage)
    → let gh = ../package-github.dhall p

      let homeUrl =
            optional.default
              Text
              ( merge
                  { Incomplete = ./render-github.dhall gh
                  , Unpublished = ./render-github.dhall gh
                  , Published = ./render-hackage.dhall p.name
                  , Unmaintained = ./render-hackage.dhall p.name
                  , Deprecated = ./render-github.dhall gh
                  }
                  p.status
              )
              p.homepage

      in  catMaybeSep
            "\n\n"
            [ Some
                (     "### "
                  ++  ./render-link.dhall { descr = p.name, url = homeUrl }
                )
            , merge
                { Incomplete = Some "*Work in Progress*"
                , Unpublished = None Text
                , Published = None Text
                , Unmaintained = Some "*Currently Unmaintained*"
                , Deprecated = Some "*Deprecated*"
                }
                p.status
            , Some (../package-buttons.dhall p)
            , Some
                ( catMaybeSep
                    "\n"
                    [ renderSupport "Minimum support" p.support.min
                    , renderSupport "Maximum support" p.support.max
                    ]
                )
            , p.notes
            ]
