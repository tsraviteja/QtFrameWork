pragma Singleton
import QtQuick 2.15

QtObject 
{
    readonly property int buttonWidthOne: 40
    readonly property int buttonWidthTwo: 61
    readonly property int buttonWidthThree: 76
    readonly property int buttonWidthFour: 136

    readonly property var rowOneContent: {
        "alphabetic":
        {
            "capitalLetter": ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
            "smallLetter": ['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p']
        },
        "symbolskey":
        {
            "first": ["+", "×", "÷", "=", "/", "_", "€", "£", "₹", "₩"],
            "second": ["`", "~", "\\", "|", "<", ">", "{", "}", "[", "]"]
        }
    }

    readonly property var rowTwoContent: {
        "alphabetic":
        {
            "capitalLetter": ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
            "smallLetter": ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l']   
        },
        "symbolskey":
        {
            "first": ["!", "@", "#", "$", "%", "^", "&", "*", "(", ")"],
            "second": ["°", "•", "○", "●", "□", "■", "♤", "♡", "◇", "♧"]
        }
    }

    readonly property var rowThreeContent: {
        "alphabetic":
        {
            "capitalLetter": ['Z', 'X', 'C', 'V', 'B', 'N', 'M'],
            "smallLetter": ['z', 'x', 'c', 'v', 'b', 'n', 'm']
        },
        "symbolsKey":
        {
            "first": ["-", "'", "\"", ":", ";", ",", "?"],
            "second": ["☆", "▪", "¤", "《", "》", "¡", "¿"]
        }
    }
}
