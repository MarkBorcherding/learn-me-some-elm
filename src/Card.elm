module Card exposing (Card, card)


type alias Card =
    { face : Char
    , up : Bool
    }


card glyph =
    { face = glyph
    , up = False
    }
