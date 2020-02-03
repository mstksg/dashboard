let types = ../../types.dhall

in    λ(name : Text)
    → λ(r : types.StackageResolver)
    → let rstring = ../show-resolver.dhall r

      in    { src = "https://stackage.org/package/${name}/badge/${rstring}"
            , link = "https://stackage.org/${rstring}/package/${name}"
            , alt = "${name} on stackage ${rstring}"
            }
          : types.Button
