let types = ../../types.dhall

let renderStyle =
        λ(s : types.ShieldsStyle)
      → merge
          { Plastic = "plastic"
          , Flat = "flat"
          , FlatSquare = "flat-square"
          , ForTheBadge = "for-the-badge"
          , Social = "social"
          }
          s

let renderOption =
        λ(o : Optional types.ShieldsStyle)
      → Optional/fold
          types.ShieldsStyle
          o
          Text
          (λ(s : types.ShieldsStyle) → "?style=${renderStyle s}")
          ""

let day = 60 * 60 * 24

in    λ(t : Text)
    → λ(s : Optional types.ShieldsStyle)
    → "https://img.shields.io/${t}${renderOption s}?maxAge=${Natural/show day}"
