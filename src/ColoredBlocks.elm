module ColoredBlocks exposing (root)

import Grid exposing (Color)
import Html exposing (Html, div)
import Types exposing (Model, Msg)
import Svg exposing (..)
import Svg.Attributes exposing (..)


{- represent the model as colored squares with one bit of precision per RBG channel -}


root : Model -> Html Msg
root =
    modelAsColors >> Grid.viewColors 1 20


modelAsColors : Model -> List Color
modelAsColors model =
    toColors model.noise


toColors : List Bool -> List Color
toColors bits =
    case bits of
        a :: b :: c :: tail ->
            (Color (asHexChar a) (asHexChar b) (asHexChar c)) :: toColors tail

        _ ->
            []


asHexChar : Bool -> Char
asHexChar bool =
    case bool of
        True ->
            'f'

        False ->
            '0'
