module View exposing (..)

import Types exposing (Model, Msg)
import Html exposing (..)
import Bits
import ColoredBlocks


root : Model -> Html Msg
root model =
    div []
        [ Bits.root model
        , ColoredBlocks.root model
        ]
