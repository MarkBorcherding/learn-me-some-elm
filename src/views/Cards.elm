module Views.Cards exposing (cards)

import Html exposing (..)
import Card exposing (Deck, Card)


upOrDown : Bool -> String
upOrDown b =
    case b of
        True ->
            "Up"

        False ->
            "Down"


cards : Card -> Html msg
cards card =
    li []
        [ text (String.fromChar card.face)
        , text "-"
        , text (upOrDown card.up)
        ]