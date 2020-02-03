let types = ../../types.dhall

in    λ(name : Text)
    →   { src =
            ../render/render-shields.dhall
              "hackage/v/${name}"
              (None types.ShieldsStyle)
        , link = ../render/render-hackage.dhall name
        , alt = "${name} on hackage"
        }
      : types.Button
