module Update exposing (..)

import Messages exposing (Message)
import Models exposing (Model)


update : Message -> Model -> ( Model, Cmd Message )
update msg model =
    case msg of
        Messages.OnFetchTrack response ->
            ( { model | track = response }, Cmd.none )
