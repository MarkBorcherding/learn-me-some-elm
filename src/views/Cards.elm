module Views.Cards exposing (cards, Message(Flip))

import Html exposing (..)
import Html.Events exposing (onClick)
import Card exposing (Card)


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
