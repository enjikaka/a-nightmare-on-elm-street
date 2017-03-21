module Commands exposing (..)

import Http
import Json.Decode
import Json.Decode.Pipeline exposing (decode, required)
import Messages exposing (Message)
import Models exposing (ActualTrack, TidalId)
import RemoteData

fetchTrack : TidalId -> Cmd Message
fetchTrack tidalId =
  let
    url = fetchTrackUrl tidalId
  in
    Http.get url trackDecoder
      |> RemoteData.sendRequest
      |> Cmd.map Messages.OnFetchTrack

fetchTrackUrl : TidalId -> String
fetchTrackUrl tidalId =
    "https://api.saoirse.audio/track/tidal/" ++ tidalId

trackDecoder : Json.Decode.Decoder ActualTrack
trackDecoder =
  decode ActualTrack
    |> required "id" Json.Decode.string
    |> required "name" Json.Decode.string
    |> required "artist" Json.Decode.string
    |> required "spotify_id" Json.Decode.string
    |> required "tidal_id" Json.Decode.string
    |> required "deezer_id" Json.Decode.string
    |> required "itunes_id" Json.Decode.string
    |> required "isrc_id" Json.Decode.string
