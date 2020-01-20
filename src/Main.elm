module Main exposing (main)

import Browser
import Html exposing (Html, button, div, h1, img, text)
import Html.Attributes exposing (src)
import Html.Events exposing (onClick)



---- MODEL ----


type alias Model =
    { count : Int }


init : Model
init =
    { count = 0 }



---- UPDATE ----


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | count = model.count + 1 }

        Decrement ->
            { model | count = model.count - 1 }



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ div []
            [ img [ src "/logo.svg" ] []
            , h1 [] [ text "Elm webinar #1" ]
            ]
        , div []
            [ button [ onClick Increment ] [ text "+1" ]
            , div [] [ text <| String.fromInt model.count ]
            , button [ onClick Decrement ] [ text "-1" ]
            ]
        ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.sandbox
        { view = view
        , init = init
        , update = update
        }
