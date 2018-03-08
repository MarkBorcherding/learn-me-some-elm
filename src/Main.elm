-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/effects/random.html


module Main exposing (..)

import Html exposing (..)
import Card exposing (Card, card, Deck)
import Views.Cards as Cards exposing (..)

main : Program Never Deck Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL





init : ( Deck, Cmd Msg )
init =
    let
        cards =
            [ card 'a'
            , card 'b'
            , card 'c'
            ]
    in
        ( { cards = cards }, Cmd.none )



-- UPDATE


type Msg
    = Flip Int


update : Msg -> Deck -> ( Deck, Cmd Msg )
update msg deck =
    case msg of
        Flip i ->
            ( deck, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Deck -> Sub Msg
subscriptions deck =
    Sub.none

-- Views

view : Deck -> Html Msg
view deck =
    div []
        [ ul [] (List.map cards deck.cards)
        ]