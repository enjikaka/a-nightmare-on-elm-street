module Commands exposing (..)

import Http
import Json.Decode
import Json.Decode.Pipeline exposing (decode, required)
import Messages exposing (Message)
import Models exposing (ActualTrack)
import RemoteData

fetchTrack : Cmd Message
fetchTrack =
  Http.get fetchTrackUrl trackDecoder
    |> RemoteData.sendRequest
    |> Cmd.map Messages.OnFetchTrack

fetchTrackUrl : String
fetchTrackUrl =
    "https://api.saoirse.audio/track/tidal/22897962"

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
