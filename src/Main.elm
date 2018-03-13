-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/effects/random.html


module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)


main : Program Never Deck Message
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Deck =
    List Card


{-| This thing does a thing
-}
card : Char -> Card
card glyph =
    { face = glyph
    , up = False
    }


init : ( Deck, Cmd Message )
init =
    let
        cards =
            [ card 'a'
            , card 'b'
            , card 'c'
            ]
    in
        ( cards, Cmd.none )


{-| This is a card blah blah blah
-}
type alias Card =
    { face : Char
    , up : Bool
    }



-- UPDATE


flip : Card -> Deck -> Deck
flip card deck =
    List.map
        (\c ->
            if c == card then
                { face = c.face, up = True }
            else
                c
        )
        deck


update : Message -> Deck -> ( Deck, Cmd Message )
update msg deck =
    case msg of
        Flip card ->
            ( (flip card deck), Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Deck -> Sub Message
subscriptions deck =
    Sub.none



-- Views


view : Deck -> Html Message
view deck =
    div []
        [ ul [] (List.map cards deck)
        ]


type Message
    = Flip Card


upOrDown : Bool -> String
upOrDown b =
    case b of
        True ->
            "Up"

        False ->
            "Down"


cardText : Card -> String
cardText card =
    (String.fromChar card.face)
        ++ " - "
        ++ (upOrDown card.up)


cards : Card -> Html Message
cards card =
    li []
        [ button [ onClick (Flip card) ] [ text <| cardText card ] ]
