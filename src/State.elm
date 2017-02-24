module State exposing (..)

import Types exposing (..)
import Random
import Bits


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Noise bools ->
            ( { model | noise = bools }, Cmd.none )
        BitsMsg subMsg ->
            let (bits, cmd ) =
                Bits.update subMsg model.noise
            in
                ( {model | noise = bits}, Cmd.none )
        Noop _ ->
            (model, Cmd.none)

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


initialModel : Model
initialModel =
    { noise = [] }


initialCmd : Cmd Msg
initialCmd =
    Random.generate Noise <| Random.list (4 * 3) Random.bool
