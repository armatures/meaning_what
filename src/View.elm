module View exposing (..)

import Types exposing (Model, Msg)
import Html exposing (..)
import Bits


root : Model -> Html Msg
root =
    Bits.root
