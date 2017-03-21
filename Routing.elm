module Routing exposing (..)

import Navigation exposing (Location)
import Models exposing (TidalId, Route(..))
import UrlParser exposing (..)

matchers : Parser (Route -> a) a
matchers =
  oneOf
    [ map TrackRoute (s "track" </> string)
    ]

parseLocation : Location -> Route
parseLocation location =
  case (parseHash matchers location) of
    Just route ->
      route
    Nothing ->
      NotFoundRoute
