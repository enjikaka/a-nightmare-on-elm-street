module Messages exposing (..)

import Models exposing (ActualTrack)
import RemoteData exposing (WebData)

type Message = OnFetchTrack (WebData ActualTrack)
