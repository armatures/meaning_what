module Bits exposing (root)

import Html exposing (Html, div)
import Types exposing (Model, Msg)
import Svg exposing (..)
import Svg.Attributes exposing (..)


{- represent the model as raw black & white squares -}


root : Model -> Html Msg
root model =
    let
        boolColor bool =
            case bool of
                True ->
                    "black"

                False ->
                    "white"

        columnCount =
            30

        sideLength =
            10

        showBool index bool =
            rect
                [ fill <| boolColor bool
                , height "10"
                , width "10"
                , y <| toString <| (*) sideLength <| index // columnCount
                , x <| toString <| (*) sideLength <| index % columnCount
                ]
                []
    in
        div []
            [ svg
                [ width <| toString <| columnCount * sideLength
                , height <| toString <| (*) sideLength <| (List.length model.noise) // columnCount
                ]
                (List.indexedMap showBool model.noise)
            ]
