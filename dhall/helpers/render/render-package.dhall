let types = ../../types.dhall

let text =
      https://raw.githubusercontent.com/dhall-lang/dhall-lang/v20.0.0/Prelude/Text/package.dhall sha256:46c53957c10bd4c332a5716d6e06068cd24ae1392ca171e6da31e30b9b33c07c

let optional =
      https://raw.githubusercontent.com/dhall-lang/dhall-lang/v20.0.0/Prelude/Optional/package.dhall sha256:37b84d6fe94c591d603d7b06527a2d3439ba83361e9326bc7b72517c7dc54d4e

let list =
      https://raw.githubusercontent.com/dhall-lang/dhall-lang/v20.0.0/Prelude/List/package.dhall sha256:547cd881988c6c5e3673ae80491224158e93a4627690db0196cb5efbbf00d2ba

let renderSupport =
      λ(t : Text) →
      λ(v : Optional types.GHCVersion) →
        optional.map
          types.GHCVersion
          Text
          (λ(u : types.GHCVersion) → "* ${t}: ${./render-ghcversion.dhall u}")
          v

let catMaybeSep =
      λ(sep : Text) →
      λ(xs : List (Optional Text)) →
        text.concatSep
          sep
          (list.concatMap (Optional Text) Text (optional.toList Text) xs)

in  λ(p : types.HaskellPackage) →
      let gh = ../package-github.dhall p

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
