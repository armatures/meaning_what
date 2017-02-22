module Tests exposing (..)

import Converter
import Test exposing (..)
import Expect
import Fuzz exposing (list, int, string, intRange)
import String


all : Test
all =
    describe "Converter"
        [ describe "toInt"
            [ test "for [false]" <|
                \() ->
                    [ False ]
                        |> Converter.toInt
                        |> Expect.equal (0)
            , test "for [true]" <|
                \() ->
                    [ True ]
                        |> Converter.toInt
                        |> Expect.equal (1)
            , test "for [true, true]" <|
                \() ->
                    [ True, True ]
                        |> Converter.toInt
                        |> Expect.equal (3)
            , test "for [false, true]" <|
                \() ->
                    [ False, True ]
                        |> Converter.toInt
                        |> Expect.equal (1)
            , test "for the third-least significant bit" <|
                \() ->
                    [ True, False, False ]
                        |> Converter.toInt
                        |> Expect.equal (4)
            ]
        , describe "toHex"
            [ test "all Falses" <|
                \() ->
                    ( False, False, False, False )
                        |> Converter.toHex
                        |> Expect.equal '0'
            , test "one True" <|
                \() ->
                    ( False, False, False, True )
                        |> Converter.toHex
                        |> Expect.equal '1'
            , test "all Trues" <|
                \() ->
                    ( True, True, True, True )
                        |> Converter.toHex
                        |> Expect.equal 'f'
            ]
        ]


expectErr : Result error value -> Expect.Expectation
expectErr val =
    case val of
        Err _ ->
            Expect.pass

        Ok okVal ->
            Expect.fail ("Expected an Err but got " ++ toString val)
