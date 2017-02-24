module Bits exposing (root, update)

import Grid exposing (Color, viewGrid)
import Html exposing (Html, div)
import Types exposing (BitMsg(ToggleBit), Model, Msg(..))
import Svg exposing (..)
import Svg.Attributes exposing (..)


{- represent the model as raw black & white squares -}


root : Types.Model -> Html Msg
root model =
    Grid.viewColors 3 20 (BitsMsg << ToggleBit) (modelAsColors model)


type alias Model =
    List Bool


update : BitMsg -> Model -> ( Model, Cmd Msg )
update msg bits =
    case msg of
        Types.ToggleBit soughtIndex ->
            let
                newBits =
                    List.indexedMap
                        (\i bool ->
                            if i == soughtIndex then
                                not bool
                            else
                                bool
                        )
                        bits
            in
                ( newBits, Cmd.none )


modelAsColors : Types.Model -> List Color
modelAsColors model =
    List.map boolColor model.noise


boolColor : Bool -> Color
boolColor bool =
    case bool of
        True ->
            Color 'f' 'f' 'f'

        False ->
            Color '0' '0' '0'
