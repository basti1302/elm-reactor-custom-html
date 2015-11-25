module Demo (main) where

import Html exposing (Html)
import Html.Attributes
import Signal exposing (Signal)
import Time exposing (every, second)

view : Float -> Int -> Int
view _ counter  = counter + 1


mainSignal : Signal Int
mainSignal =
  Signal.foldp view 0 (every second)


main : Signal Html
main =
  Signal.map
  (\ counter ->
     Html.div [ Html.Attributes.class "main" ] [
       Html.text <| toString counter
    ,  Html.text " -- change this text"
    ]
  ) mainSignal
