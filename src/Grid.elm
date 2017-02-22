module Grid exposing (viewColors, Color)

import Html exposing (Html, div)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Types exposing (Msg)


type alias Color =
    { r : Char, g : Char, b : Char }


viewColors : Int -> Int -> List Color -> Html Msg
viewColors columnCount sideLength colors =
    let
        showPixel index colorString =
            rect
                [ fill <| colorString
                , height <| toString sideLength
                , width <| toString sideLength
                , y <| toString <| (*) sideLength <| index // columnCount
                , x <| toString <| (*) sideLength <| index % columnCount
                ]
                []
    in
        div []
            [ svg
                [ width <| toString <| columnCount * sideLength
                , height <| toString <| (*) sideLength <| (List.length colors) // columnCount
                ]
                (List.indexedMap showPixel <| List.map asString colors)
            ]


asString : Color -> String
asString color =
    String.fromList [ '#', color.r, color.g, color.b ]
