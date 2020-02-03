let types = ../../types.dhall

in    λ(i : types.Image)
    → "!" ++ ./render-link.dhall { url = i.src, descr = i.alt }
