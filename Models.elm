module Models exposing (..)

import RemoteData exposing (WebData)

type alias Model =
  { track : WebData (ActualTrack)
  , route : Route
  }

initialModel : Route -> Model
initialModel route  =
  { track = RemoteData.Loading
  , route = route
  }

type alias ActualTrack = {
  id: String,
  name: String,
  artist: String,
  spotify_id: String,
  tidal_id: String,
  deezer_id: String,
  itunes_id: String,
  isrc_id: String
}

type alias TidalId = String

type Route
  = TrackRoute TidalId
  | NotFoundRoute

