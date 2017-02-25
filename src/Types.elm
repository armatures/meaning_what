module Types exposing (..)


type alias Model =
    { noise : List Bool }


type Msg
    = Noise (List Bool)
    | ToggleBit Int
    | Noop Int
