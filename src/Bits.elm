module Bits exposing (root)

import Grid exposing (Color, viewGrid)
import Html exposing (Html, div)
import Types exposing (Model, Msg)
import Svg exposing (..)
import Svg.Attributes exposing (..)


{- represent the model as raw black & white squares -}


root : Model -> Html Msg
root model =
    Grid.viewColors 3 20 (modelAsColors model)


modelAsColors : Model -> List Color
modelAsColors model =
    List.map boolColor model.noise


boolColor : Bool -> Color
boolColor bool =
    case bool of
        True ->
            Color 'f' 'f' 'f'

        False ->
            Color '0' '0' '0'
