let types = ../../types.dhall

in    λ(gh : { repo : Text, user : Text })
    →   { src =
            ../render/render-shields.dhall
              "github/issues-pr/${gh.user}/${gh.repo}"
              (None types.ShieldsStyle)
        , link = ../render/render-github.dhall gh ++ "/pulls"
        , alt = "${gh.repo} pull requests"
        }
      : types.Button
