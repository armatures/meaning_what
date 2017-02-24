module Grid exposing (viewColors, viewGrid, Color)

import Html exposing (Html, div)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Svg exposing (..)
import Svg.Attributes exposing (display, fill, x, y)
import Types exposing (Msg(..), BitMsg(..))


type alias Color =
    { r : Char, g : Char, b : Char }


viewColors : Int -> Int -> (Int -> Msg) -> List Color -> Html Msg
viewColors columnCount sideLength msg colors =
    viewGrid columnCount sideLength sideLength msg colors


viewGrid : Int -> Int -> Int -> (Int -> Msg) -> List Color -> Html Msg
viewGrid columnCount pixelHeight pixelWidth msg colors =
    let
        showPixel index colorString =
            rect
                [ fill <| colorString
                , height pixelHeight
                , width pixelWidth
                , y <| toString <| (*) pixelHeight <| index // columnCount
                , x <| toString <| (*) pixelWidth <| index % columnCount
                , onClick <| msg index
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
