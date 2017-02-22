module Grid exposing (viewColors, viewGrid, Color)

import Html exposing (Html, div)
import Html.Attributes exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (display, fill, x, y)
import Types exposing (Msg)


type alias Color =
    { r : Char, g : Char, b : Char }


viewColors : Int -> Int -> List Color -> Html Msg
viewColors columnCount sideLength colors =
    viewGrid columnCount sideLength sideLength colors


viewGrid : Int -> Int -> Int -> List Color -> Html Msg
viewGrid columnCount pixelHeight pixelWidth colors =
    let
        showPixel index colorString =
            rect
                [ fill <| colorString
                , height pixelHeight
                , width pixelWidth
                , y <| toString <| (*) pixelHeight <| index // columnCount
                , x <| toString <| (*) pixelWidth <| index % columnCount
                ]
                []
    in
        svg
            [ width <| columnCount * pixelWidth
            , height <| (*) pixelHeight <| Basics.ceiling <| toFloat (List.length colors) / toFloat columnCount
            , display "inline-block"
            ]
            (List.indexedMap showPixel <| List.map asString colors)


asString : Color -> String
asString color =
    String.fromList [ '#', color.r, color.g, color.b ]
