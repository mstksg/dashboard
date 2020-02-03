{ name : Text
, support :
    { min : Optional ./GHCVersion.dhall, max : Optional ./GHCVersion.dhall }
, status : ./Status.dhall
, homepage : Optional Text
, github : { repo : Optional Text, user : Text }
, notes : Optional Text
}
