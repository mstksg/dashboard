let types = ../types.dhall

in    λ(s : types.Status)
    → merge
        { Incomplete = False
        , Unpublished = False
        , Published = True
        , Unmaintained = True
        , Deprecated = True
        }
        s
