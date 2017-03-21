module Messages exposing (..)

import Models exposing (ActualTrack)
import Navigation exposing (Location)
import RemoteData exposing (WebData)

type Message = OnFetchTrack (WebData ActualTrack)
             | OnLocationChange Location
