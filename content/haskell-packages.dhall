let types = ../dhall/types.dhall

let helpers = ../dhall/helpers/package.dhall

let GHC = types.GHCVersion

let ghc =
        λ(major : Natural)
      → λ(minor : Natural)
      → Some (helpers.mkGHCVersion major minor)

let Status = types.Status

let mkPkg = (../dhall/defaults.dhall).HaskellPackage

in  [ mkPkg::{ name = "advent-of-code-api" }
    , mkPkg::{ name = "advent-of-code-dev", status = Status.Unpublished }
    , mkPkg::{ name = "auto" }
    , mkPkg::{ name = "backprop", homepage = Some "https://backprop.jle.im" }
    , mkPkg::{
      , name = "backprop-learn"
      , status = Status.Incomplete
      , support = { min = ghc 8 8, max = ghc 8 8 }
      }
    , mkPkg::{ name = "bins" }
    , mkPkg::{ name = "conduino" }
    , mkPkg::{ name = "configurator-export" }
    , mkPkg::{
      , name = "cv-static"
      , status = Status.Unpublished
      , homepage = Some "https://cv.jle.im"
      }
    , mkPkg::{ name = "decidable", support = { min = ghc 8 8, max = ghc 8 8 } }
    , mkPkg::{ name = "data-diff", status = Status.Incomplete }
    , mkPkg::{ name = "emd" }
    , mkPkg::{ name = "functor-combinators" }
    , mkPkg::{
      , name = "functor-products"
      , support = { min = ghc 8 8, max = ghc 8 8 }
      }
    , mkPkg::{ name = "ghcjs-websockets", status = Status.Deprecated }
    , mkPkg::{ name = "hakyll-dhall" }
    , mkPkg::{ name = "hamilton", support = { min = ghc 8 0, max = ghc 8 8 } }
    , mkPkg::{ name = "hmatrix-backprop" }
    , mkPkg::{
      , name = "hmatrix-vector-sized"
      , support = { min = ghc 8 0, max = ghc 8 8 }
      }
    , mkPkg::{
      , name = "inCode"
      , status = Status.Unpublished
      , homepage = Some "https://blog.jle.im"
      }
    , mkPkg::{ name = "interactive-plot" }
    , mkPkg::{ name = "jle-utils", status = Status.Unpublished }
    , mkPkg::{ name = "lens-typelevel" }
    , mkPkg::{ name = "list-witnesses" }
    , mkPkg::{
      , name = "mutable"
      , homepage = Some "https://mutable.jle.im"
      , support = { min = ghc 8 6, max = ghc 8 8 }
      }
    , mkPkg::{ name = "nonempty-containers" }
    , mkPkg::{ name = "one-liner-instances" }
    , mkPkg::{ name = "opto", status = Status.Incomplete }
    , mkPkg::{ name = "otp-authenticator" }
    , mkPkg::{ name = "prompt" }
    , mkPkg::{ name = "pandoc-sync", status = Status.Incomplete }
    , mkPkg::{ name = "servant-cli" }
    , mkPkg::{ name = "santabot", status = Status.Unpublished }
    , mkPkg::{ name = "tagged-binary" }
    , mkPkg::{
      , name = "type-combinators-singletons"
      , status = Status.Deprecated
      }
    , mkPkg::{ name = "typelits-witnesses" }
    , mkPkg::{
      , name = "typelits-printf"
      , status = Status.Unpublished
      , notes = Some
          "Awaiting upload of patch VinylRecords/Vinyl#131 to hackage"
      }
    , mkPkg::{ name = "uncertain" }
    , mkPkg::{ name = "wavelets", status = Status.Incomplete }
    ]
