module View exposing (..)

import Html.Attributes exposing (attribute)
import MoreColoredBlocks
import Types exposing (Model, Msg)
import Html exposing (..)
import Bits
import ColoredBlocks
import Grid exposing (Color, viewGrid)


root : Model -> Html Msg
root model =
    let
        colorGuide =
            viewGrid 3
                3
                20
                [ Color 'f' '0' '0'
                , Color '0' 'f' '0'
                , Color '0' '0' 'f'
                ]

        flexInDirection rowOrColumn =
            [ attribute "display" "flex", attribute "flex-direction" rowOrColumn ]
    in
        div
            (flexInDirection "column")
            [ colorGuide
            , div
                (flexInDirection "row")
                [ Bits.root model
                , ColoredBlocks.root model
                ]
            , MoreColoredBlocks.root model
            ]
