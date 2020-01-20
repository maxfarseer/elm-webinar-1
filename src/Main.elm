module Main exposing (main)

import Browser
import Html exposing (Html, button, div, h1, hr, img, text)
import Html.Attributes exposing (disabled, src)
import Html.Events exposing (onClick)



---- MODEL ----


type alias Model =
    { count : Int
    , status : Status
    }


type Status
    = Opened
    | Closed


init : Model
init =
    { count = 0
    , status = Opened
    }



---- UPDATE ----


type Msg
    = Increment
    | Decrement
    | Reset
    | PleaseOpen
    | PleaseClose


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | count = model.count + 1 }

        Decrement ->
            { model | count = model.count - 1 }

        Reset ->
            { model | count = 0 }

        PleaseOpen ->
            { model | status = Opened }

        PleaseClose ->
            { model | status = Closed }



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
            , button [ onClick PleaseOpen ] [ text "open" ]
            , button [ onClick PleaseClose ] [ text "close" ]
            , hr [] []
            , renderDiv model.status
            ]
        ]


ifResetDisabled : Int -> Bool
ifResetDisabled counterValue =
    if counterValue == 0 then
        True

    else
        False


renderDiv : Status -> Html Msg
renderDiv status =
    case status of
        Opened ->
            div [] [ text "Открыто" ]

        Closed ->
            text ""



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.sandbox
        { view = view
        , init = init
        , update = update
        }
