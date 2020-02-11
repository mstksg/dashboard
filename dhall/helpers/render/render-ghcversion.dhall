let types = ../../types.dhall

in    λ(mm : types.GHCVersion)
    → "GHC ${Natural/show mm.major}.${Natural/show mm.minor}"
