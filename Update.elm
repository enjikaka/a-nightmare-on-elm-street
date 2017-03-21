module Update exposing (..)

import Messages exposing (Message)
import Models exposing (Model)
import Routing exposing (parseLocation)


update : Message -> Model -> ( Model, Cmd Message )
update msg model =
    case msg of
        Messages.OnFetchTrack response ->
            ( { model | track = response }, Cmd.none )
        Messages.OnLocationChange location ->
          let
            newRoute = parseLocation location
          in
            ({ model | route = newRoute }, Cmd.none)
