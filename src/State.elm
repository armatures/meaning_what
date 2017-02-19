module State exposing (..)

import Types exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Noise bools ->
            ( { model | noise = bools }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


initialModel : Model
initialModel =
    { noise = [] }


initialCmd : Cmd Msg
initialCmd =
    Cmd.none
