let types = ../../types.dhall

in    λ(b : types.Button)
    → ./render-link.dhall
        { url = b.link, descr = ./render-image.dhall b.{ alt, src } }
