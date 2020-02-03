let types = ./types.dhall

in  { HaskellPackage =
        { Type = types.HaskellPackage
        , default =
            { support =
                { min = None types.GHCVersion, max = None types.GHCVersion }
            , status = types.Status.Published
            , homepage = None types.Link
            , github = { repo = None Text, user = "mstksg" }
            , notes = None Text
            }
        }
    }
