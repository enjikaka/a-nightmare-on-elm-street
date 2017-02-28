module Models exposing (..)

import RemoteData exposing (WebData)

type alias Model =
  { track : WebData (ActualTrack)
  }

initialModel : Model
initialModel =
  { track = RemoteData.Loading
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
