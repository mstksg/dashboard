let types = ../../types.dhall

in    λ(gh : { repo : Text, user : Text })
    →   { src =
            ../render/render-shields.dhall
              "github/issues/${gh.user}/${gh.repo}"
              (None types.ShieldsStyle)
        , link = ../render/render-github.dhall gh ++ "/issues"
        , alt = "${gh.repo} issue tracker"
        }
      : types.Button
