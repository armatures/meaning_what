module Converter exposing (toInt, toHex)

{-| interpret the bits passed in as an integer
-}

import Array
import Char


toInt : List Bool -> Int
toInt bools =
    bools
        |> List.reverse
        |> List.indexedMap
            (\significance bool ->
                if bool then
                    2 ^ significance
                else
                    0
            )
        |> List.sum


toHex : ( Bool, Bool, Bool, Bool ) -> Char
toHex ( a, b, c, d ) =
    let
        int =
            toInt [ a, b, c, d ]

        maybe =
            String.toList "0123456789abcdef"
                |> Array.fromList
                |> Array.get int
    in
        case maybe of
            Just a ->
                a

            Nothing ->
                Debug.crash "no hex value found in Converter.toHex function!"



--                ['0' ,'1' ,'2' ,'3' ,'4' ,'6' ,'7' ,'8' ,'9' ,'a' ,'b' ,'c' ,'d' ,'e' ,'f' ]
--    List.foldr (\bool accumulator -> 1 + accumulator) 0 bools
