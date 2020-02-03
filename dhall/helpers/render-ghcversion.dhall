let types = ../types.dhall

in    λ(v : types.GHCVersion)
    → merge
        { GHC804 = "GHC 8.4"
        , GHC806 = "GHC 8.6"
        , GHC808 = "GHC 8.8"
        , GHC810 = "GHC 8.10"
        }
        v
