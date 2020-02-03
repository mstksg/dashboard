let types = ../types.dhall

let optional =
      https://raw.githubusercontent.com/dhall-lang/dhall-lang/v13.0.0/Prelude/Optional/package.dhall sha256:7608f2d38dabee8bfe6865b4adc11289059984220f422d2b023b15b3908f7a4c

in    λ(p : types.HaskellPackage)
    → { repo = optional.default Text p.name p.github.repo } ∧ p.github.{ user }
