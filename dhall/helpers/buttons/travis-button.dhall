let types = ../../types.dhall

in    λ(gh : { repo : Text, user : Text })
    →   { src = "https://travis-ci.org/${gh.user}/${gh.repo}.svg?branch=master"
        , link = "https://travis-ci.org/${gh.user}/${gh.repo}"
        , alt = "${gh.repo} build status"
        }
      : types.Button
