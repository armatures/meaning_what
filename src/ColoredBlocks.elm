module ColoredBlocks exposing (root)

import Html exposing (Html, div)
import Types exposing (Model, Msg)
import Svg exposing (..)
import Svg.Attributes exposing (..)


{- represent the model as colored squares -}


root : Model -> Html Msg
root model =
    let
        columnCount =
            30

        sideLength =
            10

        showColor index color =
            rect
                [ fill <| asHex color
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
                , height <| toString <| (*) sideLength <| (List.length model.noise) // columnCount
                ]
                (List.indexedMap showColor (toColors model.noise))
            ]


type alias Color =
    { r : Bool, g : Bool, b : Bool }


toColors : List Bool -> List Color
toColors bits =
    case bits of
        a :: b :: c :: tail ->
            (Color a b c) :: toColors tail

        _ ->
            []


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
