module Types exposing (..)


type alias Model =
    { noise : List Bool }


type Msg
    = Noise (List Bool)
    | BitsMsg BitMsg
    | Noop Int


type BitMsg
    = ToggleBit Int
