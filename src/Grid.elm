module Grid exposing (viewColors, Color)

import Html exposing (Html, div)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Types exposing (Msg)


type alias Color =
    { r : Bool, g : Bool, b : Bool }


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
                (List.indexedMap showPixel <| List.map asHex colors)
            ]


asHex : Color -> String
asHex color =
    let
        channelString bool =
            case bool of
                True ->
                    "f"

                False ->
                    "0"
    in
        "#" ++ channelString color.r ++ channelString color.g ++ channelString color.b
