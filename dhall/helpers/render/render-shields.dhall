let types = ../../types.dhall

let optional =
      https://raw.githubusercontent.com/dhall-lang/dhall-lang/v20.0.0/Prelude/Optional/package.dhall sha256:37b84d6fe94c591d603d7b06527a2d3439ba83361e9326bc7b72517c7dc54d4e

let renderStyle =
      λ(s : types.ShieldsStyle) →
        merge
          { Plastic = "plastic"
          , Flat = "flat"
          , FlatSquare = "flat-square"
          , ForTheBadge = "for-the-badge"
          , Social = "social"
          }
          s

let renderOption =
      λ(o : Optional types.ShieldsStyle) →
        optional.fold
          types.ShieldsStyle
          o
          Text
          (λ(s : types.ShieldsStyle) → "&style=${renderStyle s}")
          ""

let day = 60 * 60 * 24

in  λ(t : Text) →
    λ(s : Optional types.ShieldsStyle) →
      "https://img.shields.io/${t}?maxAge=${Natural/show day}${renderOption s}"
