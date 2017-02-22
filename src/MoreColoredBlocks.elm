module MoreColoredBlocks exposing (root)

import Converter
import Grid exposing (Color)
import Html exposing (Html, div)
import Types exposing (Model, Msg)
import Svg exposing (..)
import Svg.Attributes exposing (..)


{- represent the model as squares colored with 4 bits of precision per channel! -}


root : Model -> Html Msg
root =
    toColors >> Grid.viewColors 18 10


toColors : Model -> List Color
toColors model =
    toColorsHelp ( [], model.noise )


toColorsHelp : ( List Char, List Bool ) -> List Color
toColorsHelp =
    \tuple ->
        case tuple of
            ( r :: g :: b :: hexTail, bools ) ->
                (Color r g b) :: toColorsHelp ( hexTail, bools )

            ( hexValues, a :: b :: c :: d :: boolTail ) ->
                toColorsHelp ( [ Converter.toHex ( a, b, c, d ) ] ++ hexValues, boolTail )

            _ ->
                []
