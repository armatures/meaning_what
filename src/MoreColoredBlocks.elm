module MoreColoredBlocks exposing (root)

import Converter
import Grid exposing (Color)
import Html exposing (Html, div)
import Types exposing (Model, Msg(Noop))
import Svg exposing (..)
import Svg.Attributes exposing (..)


{- represent the model as squares colored with 4 bits of precision per channel! -}


root : Model -> Html Msg
root =
    toColors >> Grid.viewColors 18 20 Noop


toColors : Model -> List Color
toColors model =
    toColorsHelp ( [], model.noise )


toColorsHelp : ( List Char, List Bool ) -> List Color
toColorsHelp =
    \tuple ->
        case tuple of
            ( r :: g :: b :: hexTail, bools ) ->
                (Color r g b) :: toColorsHelp ( hexTail, bools )

            ( hexValues, r1 :: g1 :: b1 :: r2 :: g2 :: b2 :: r3 :: g3 :: b3 :: r4 :: g4 :: b4 :: boolTail ) ->
                toColorsHelp
                    ( [ Converter.toHex ( r1, r2, r3, r4 )
                      , Converter.toHex ( g1, g2, g3, g4 )
                      , Converter.toHex ( b1, b2, b3, b4 )
                      ]
                        ++ hexValues
                    , boolTail
                    )

            _ ->
                []
