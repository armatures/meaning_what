module Bits exposing (root)

import Grid exposing (Color)
import Html exposing (Html, div)
import Types exposing (Model, Msg)
import Svg exposing (..)
import Svg.Attributes exposing (..)


{- represent the model as raw black & white squares -}


root : Model -> Html Msg
root =
    modelAsColors >> Grid.viewColors 60 3


modelAsColors : Model -> List Color
modelAsColors model =
    List.map boolColor model.noise


boolColor : Bool -> Color
boolColor bool =
    case bool of
        True ->
            Color '0' '0' '0'

        False ->
            Color 'f' 'f' 'f'
