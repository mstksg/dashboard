let types = ../../types.dhall

in    λ(gh : { repo : Text, user : Text })
    →   { src =
            ../render/render-shields.dhall
              "github/stars/${gh.user}/${gh.repo}"
              (Some types.ShieldsStyle.Social)
        , link = ../render/render-github.dhall gh
        , alt = "${gh.repo} repository"
        }
      : types.Button
