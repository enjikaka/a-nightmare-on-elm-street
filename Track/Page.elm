module Track.Page exposing (..)

import Html exposing (..)
import Messages exposing (Message)
import RemoteData
import RemoteData exposing (WebData)
import Models exposing (ActualTrack, Model)

view : WebData ActualTrack -> Html Message
view model = maybeTrackRow model


maybeTrackRow : WebData ActualTrack -> Html Message
maybeTrackRow response =
  case response of
    RemoteData.NotAsked ->
      text ""
    RemoteData.Loading ->
      text "Loading..."
    RemoteData.Success track ->
      trackRow track
    RemoteData.Failure error ->
      text (toString error)


trackRow : ActualTrack -> Html Message
trackRow track =
    div []
        [ div [] [ text track.id ]
        , div [] [ text track.name ]
        , div [] [ text track.spotify_id ]
        , div [] [ text track.tidal_id ]
        , div [] [ text track.deezer_id ]
        , div [] [ text track.itunes_id ]
        , div [] [ text track.isrc_id ]
        ]
