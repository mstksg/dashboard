let types = ../types.dhall

let optional =
      https://raw.githubusercontent.com/dhall-lang/dhall-lang/v20.0.0/Prelude/Optional/package.dhall sha256:37b84d6fe94c591d603d7b06527a2d3439ba83361e9326bc7b72517c7dc54d4e

in  λ(p : types.HaskellPackage) →
      { repo = optional.default Text p.name p.github.repo } ∧ p.github.{ user }
