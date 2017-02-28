module View exposing (..)

import Html exposing (Html, div, text)
import Messages exposing (Message)
import Models exposing (Model)
import Track.Page


view : Model -> Html Message
view model =
    div []
        [ page model ]


page : Model -> Html Message
page model =
    Track.Page.view model.track
