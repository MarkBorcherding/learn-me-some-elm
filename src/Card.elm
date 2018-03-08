module Card exposing (Card, card, Deck)

type alias Deck =
    { cards : List Card
    }


type alias Card =
    { face : Char
    , up : Bool
    }


card glyph =
    { face = glyph
    , up = False
    }