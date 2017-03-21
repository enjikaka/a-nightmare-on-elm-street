module View exposing (..)

import Html exposing (Html, div, text)
import Messages exposing (Message)
import Models exposing (Model, TidalId)
import RemoteData
import Track.Page


view : Model -> Html Message
view model =
    div []
        [ page model ]

page : Model -> Html Message
page model =
  case model.route of
    Models.TrackRoute id ->
      trackViewPage model id
    Models.NotFoundRoute ->
      notFoundView

trackViewPage : Model -> TidalId -> Html Message
trackViewPage model tidalId =
  case model.track of
    RemoteData.NotAsked ->
      text ""
    RemoteData.Loading ->
      text "Loading..."
    RemoteData.Success track ->
      Track.Page.view model.track
    RemoteData.Failure err ->
      text (toString err)

notFoundView : Html Message
notFoundView =
  div []
    [ text "Not found"
    ]
