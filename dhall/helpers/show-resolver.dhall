let types = ../types.dhall

in  λ(r : types.StackageResolver) → merge { LTS = "lts", Nightly = "nightly" } r
