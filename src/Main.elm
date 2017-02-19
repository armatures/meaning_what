module Main exposing (..)

import Html
import Types
import State exposing (..)
import View exposing (..)


main : Program Never Types.Model Types.Msg
main =
    Html.program
        { init = ( State.initialModel, State.initialCmd )
        , update = State.update
        , subscriptions = State.subscriptions
        , view = View.root
        }
