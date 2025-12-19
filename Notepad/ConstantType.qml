pragma Singleton
import QtQuick 2.12

Item
{
    readonly property int textAreaFontsize:12

    readonly property var windowDimension:
    {
        "setWidth":800,
        "setHeight":600,
        "setVisible":true,
        "setTitle":"NotePad"
    }

    readonly property var imageProperty:
    {
        "setWidth":30,
        "setHeight":30,
        "leftArrowSource":"qrc:/leftarrow.png"
    }

    readonly property var menuProperty:
    {
        "backGroundColor":'white',
        "borderColor":'lightgrey',
        "menuItemFontSize":12,
        "menuFontSize":16
    }

    readonly property var tabContainerProperty:
    {
        "lessWidth":60,
        "setHeight":30,
        "color":'lightgrey',
        "borderWidth":1,
        "spacing":1
    }

    readonly property var scrollBar:
    {
        "lessHeight":28,
        "yPosition":30,
        "verticalWidthAndHeight":15
    }

    readonly property var footerProperty:
    {
        "color":'white',
        "borderColor":'lightgrey',
        "height":30,
        "textFontSize":14,
    }

    readonly property var tabProperty:
    {
        "setWidth":212,
        "setHeight":30,
        "color":['lightgrey','#fce68d'],
        "fileImage":{
            "source":"qrc:/file.png",
            "setWidth":30,
            "setHeight":30
        },
        "cancelImage":
        {
            "source":"qrc:/cancel.png",
            "setWidth":22,
            "setHeight":22,
            "xPosition":186
        }
    }

    readonly property var popDailogProperty:
    {
        "setWidth":375,
        "setHeight":150,
        "fontSize":14,
        "textPosition":20,
        "borderColor":"black",
        "button":
        {
            "setWidth":80,
            "setHeight":40,
            "radius":14,
            "yPosition":50,
            "textColor":'black',
            "borderColor":"black"
        },
        "cancelButton":
        {
            "xPosition":20
        },
        "saveButton":
        {
            "xPosition":120
        },
        "saveAsButton":
        {
            "xPosition":120
        }
    }

    readonly property var findAndReplaceDialog:
    {
        "setWidth":300,
        "setHeight":210,
        "headerHeight":40,
        "headerColor":'white',
        "borderColor": 'black',
        "headerBorderWidth":1,
        "cancelImage":
        {
            "source":'qrc:/cancel.png',
            "width":28,
            "height":28,
            "xPosition":260
        },
        "fontSize":14,
        "findRowSpacing":10,
        "replaceRowSpacing":52,
        "roundButton":
        {
            "setWidth":150,
            "setHeight":40,
            "xPosition":80,
            "yPosition":110
        }
    }
}
