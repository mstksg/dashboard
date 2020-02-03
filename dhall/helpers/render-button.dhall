let types = ../types.dhall

in  λ(b : types.Button) → "[![${b.alt}](${b.src})](${b.link})"
