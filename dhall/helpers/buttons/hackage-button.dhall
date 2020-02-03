let types = ../../types.dhall

in    λ(name : Text)
    →   { src =
            ../render-shields.dhall
              "hackage/v/${name}"
              (None types.ShieldsStyle)
        , link = "https://hackage.haskell.org/package/${name}"
        , alt = "${name} on hackage"
        }
      : types.Button
