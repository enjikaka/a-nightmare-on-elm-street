module Update exposing (..)

import Commands exposing (fetchTrack)
import Messages exposing (Message)
import Models exposing (Model, Route)
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
            ({ model | route = newRoute }, updateTrackData newRoute)

updateTrackData : Route -> Cmd Message
updateTrackData newRoute =
  case newRoute of
    Models.TrackRoute tidalId ->
      fetchTrack tidalId
    Models.NotFoundRoute ->
      Cmd.none
