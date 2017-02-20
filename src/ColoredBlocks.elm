module ColoredBlocks exposing (root)

import Grid exposing (Color)
import Html exposing (Html, div)
import Types exposing (Model, Msg)
import Svg exposing (..)
import Svg.Attributes exposing (..)


{- represent the model as colored squares -}


root : Model -> Html Msg
root =
    modelAsColors >> Grid.viewColors 30 10


modelAsColors : Model -> List Color
modelAsColors model =
    toColors model.noise


toColors : List Bool -> List Color
toColors bits =
    case bits of
        a :: b :: c :: tail ->
            (Color a b c) :: toColors tail

        _ ->
            []
