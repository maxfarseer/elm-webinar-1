module Main exposing (main)

import Browser
import Html exposing (Html, button, div, h1, hr, img, text)
import Html.Attributes exposing (disabled, src)
import Html.Events exposing (onClick)



---- MODEL ----


type alias Model =
    { count : Int
    , status : Bool
    }


init : Model
init =
    { count = 0
    , status = False
    }



---- UPDATE ----


type Msg
    = Increment
    | Decrement
    | Reset


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | count = model.count + 1 }

        Decrement ->
            { model | count = model.count - 1 }

        Reset ->
            { model | count = 0 }



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
            , hr [] []
            , button [ onClick Reset, disabled (ifResetDisabled model.count) ] [ text "reset" ]
            , renderDiv model.status
            ]
        ]


ifResetDisabled : Int -> Bool
ifResetDisabled counterValue =
    if counterValue == 0 then
        True

    else
        False


renderDiv : Bool -> Html Msg
renderDiv status =
    if status == False then
        div [] [ text "Открыто" ]

    else
        text ""



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.sandbox
        { view = view
        , init = init
        , update = update
        }
