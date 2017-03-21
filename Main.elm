module Main exposing (..)

import Messages exposing (Message)
import Models exposing (Model, initialModel)
import Update exposing (update, updateTrackData)
import View exposing (view)
import Navigation exposing (Location)
import Routing

init : Location -> ( Model, Cmd Message )
init location =
  let
    currentRoute = Routing.parseLocation location
  in
    ( initialModel currentRoute, updateTrackData currentRoute )

subscriptions : Model -> Sub Message
subscriptions model =
    Sub.none

main : Program Never Model Message
main =
    Navigation.program Messages.OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
