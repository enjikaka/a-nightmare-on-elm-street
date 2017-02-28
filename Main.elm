module Main exposing (..)

import Commands exposing (fetchTrack)
import Html exposing (program)
import Messages exposing (Message)
import Models exposing (Model, initialModel)
import Update exposing (update)
import View exposing (view)

init : ( Model, Cmd Message )
init = ( initialModel, fetchTrack )

subscriptions : Model -> Sub Message
subscriptions model =
    Sub.none

main : Program Never Model Message
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
