let types = ../../types.dhall

in    λ(gh : { repo : Text, user : Text })
    →   { src =
            ../render/render-shields.dhall
              "github/last-commit/${gh.user}/${gh.repo}"
              (None types.ShieldsStyle)
        , link = ../render/render-github.dhall gh ++ "/commits"
        , alt = "${gh.repo} last commit"
        }
      : types.Button
