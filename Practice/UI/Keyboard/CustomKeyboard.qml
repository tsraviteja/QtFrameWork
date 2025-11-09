import QtQuick 2.12
import UI.Constants 1.0 

Rectangle
{
    id: container
    objectName: "#container"
    width: parent.width
    height: 270
    border.color: "grey"
    border.width: 2
    color: "green"

    MouseArea{
        anchors.fill:parent
    }

    signal addTextFieldContent(string content)

    readonly property var rowNumberContent: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0']
    property bool isCapitalized: false
    property bool isFirstSymbols: false

    readonly property var rowOneContent: shiftTextId.text === "⇧" ? 
                       (isCapitalized ? CustomKeyboardConstant.rowOneContent.alphabetic.capitalLetter
                       : CustomKeyboardConstant.rowOneContent.alphabetic.smallLetter)
                       : (isFirstSymbols ? CustomKeyboardConstant.rowOneContent.symbolskey.first
                       : CustomKeyboardConstant.rowOneContent.symbolskey.second)


    readonly property var rowTwoContent: shiftTextId.text === "⇧" ? 
                       (isCapitalized ? CustomKeyboardConstant.rowTwoContent.alphabetic.capitalLetter
                       : CustomKeyboardConstant.rowTwoContent.alphabetic.smallLetter)
                       : (isFirstSymbols ? CustomKeyboardConstant.rowTwoContent.symbolskey.first
                       : CustomKeyboardConstant.rowTwoContent.symbolskey.second)

    readonly property var rowThreeContent: shiftTextId.text === "⇧" ? 
                       (isCapitalized ? CustomKeyboardConstant.rowThreeContent.alphabetic.capitalLetter
                       : CustomKeyboardConstant.rowThreeContent.alphabetic.smallLetter)
                       : (isFirstSymbols ? CustomKeyboardConstant.rowThreeContent.symbolsKey.first
                       : CustomKeyboardConstant.rowThreeContent.symbolsKey.second)

    Row
    {
        id: numberBlock
        objectName: "numberBlock"
        spacing:2
        leftPadding:1
        Repeater
        {
            model: rowNumberContent
            delegate: Rectangle {
                required property string modelData
                objectName: "number" + modelData
                width: 40
                height: 40
                color: 'white'
                Text
                {
                    id: numberText
                    color:'black'
                    text: parent.modelData
                    anchors.centerIn: parent
                }
                radius: 4
                border.color: 'grey'
                MouseArea
                {
                    anchors.fill: parent
                    onPressed:
                    {
                        parent.color = "skyblue"
                        addTextFieldContent(numberText.text)
                    }
                    onReleased:
                    {
                        parent.color = "white"
                    }
                }
            }
        }
    }
    Row
    {
        id: secondRow
        anchors.top: numberBlock.bottom
        anchors.topMargin: 2
        objectName: "secondRow"
        spacing:2
        leftPadding:1
        Repeater
        {
            model: rowOneContent
            delegate: Rectangle {
                required property string modelData
                objectName: "second" + modelData
                width: 40
                height: 40
                color: 'white'
                Text
                {
                    id: secondBlockText
                    color:'black'
                    text: parent.modelData
                    anchors.centerIn: parent
                }
                radius: 4
                border.color: 'grey'
                MouseArea
                {
                    anchors.fill: parent
                    onPressed:
                    {
                        parent.color = "skyblue"
                        addTextFieldContent(secondBlockText.text)
                    }
                    onReleased:
                    {
                        parent.color = "white"
                    }
                }
            }
        }
    }
    
    Row
    {
        id: thirdRow
        anchors.top: secondRow.bottom
        anchors.topMargin: 2
        objectName: "thirdRow"
        spacing:2
        leftPadding: shiftTextId.text === "⇧" ? 25 : 0
        Repeater
        {
            model: rowTwoContent
            delegate: Rectangle {
                required property string modelData
                required property int index
                objectName: "second" + modelData
                width: 40
                height: 40
                color: 'white'
                Text
                {
                    id: thirdBlockText
                    color:'black'
                    text: parent.modelData
                    anchors.centerIn: parent
                }
                radius: 4
                border.color: 'grey'
                MouseArea
                {
                    anchors.fill: parent
                    onPressed:
                    {
                        parent.color = "skyblue"
                        addTextFieldContent(thirdBlockText.text)
                    }
                    onReleased:
                    {
                        parent.color = "white"
                    }
                }
            }
        }
    }
    
    
    Row
    {
        id: fourthRow
        anchors.top: thirdRow.bottom
        anchors.topMargin: 2
        objectName: "fouthRow"
        spacing:2
        leftPadding:1
        Rectangle
        {
            width: 61
            height: 40
            color: 'white'
            radius: 4
            border.color: 'grey'
            Text
            {
                id: shiftTextId
                text: "⇧"
                color: "black"
                anchors.centerIn: parent
            }
            MouseArea
                {
                    anchors.fill: parent
                    onPressed:
                    {
                        parent.color = "skyblue"
                        if (shiftTextId.text === "⇧")
                        {
                            isCapitalized = !isCapitalized;
                        }
                        else
                        {
                            isFirstSymbols = !isFirstSymbols;
                            shiftTextId.text = shiftTextId.text === "1/2" ? "2/2" : "1/2";
                        }
                    }
                    onReleased:
                    {
                        parent.color = "white"
                    }
                }
        }
        Repeater
        {
            model: rowThreeContent
            delegate: Rectangle {
                required property var modelData
                required property int index
                objectName: "second" + modelData
                width: 40
                height: 40
                color: 'white'
                Text
                {
                    id: fourthBlockText
                    color:'black'
                    text: parent.modelData
                    anchors.centerIn: parent
                }
                radius: 4
                border.color: 'grey'
                MouseArea
                {
                    anchors.fill: parent
                    onPressed:
                    {
                        parent.color = "skyblue"
                        addTextFieldContent(fourthBlockText.text)
                    }
                    onReleased:
                    {
                        parent.color = "white"
                    }
                }
            }
        }
        Rectangle
        {
            width: 61
            height: 40
            color: 'white'
            radius: 4
            border.color: 'grey'
            Text
            {
                id: backTextId
                text: "⌫"
                color: "black"
                anchors.centerIn: parent
            }
            MouseArea
                {
                    anchors.fill: parent
                    onPressed:
                    {
                        parent.color = "skyblue"
                        addTextFieldContent(backTextId.text)
                    }
                    onReleased:
                    {
                        parent.color = "white"
                    }
                }
        }
    }
    
    
    Row
    {
        id: fithRow
        anchors.top: fourthRow.bottom
        anchors.topMargin: 2
        objectName: "fithRow"
        spacing:2
        leftPadding:1
        Rectangle
        {
            width: 76
            height: 40
            color: 'white'
            radius: 4
            border.color: 'grey'
            Text
            {
                id: specialKeyTextId
                text: "!#1"
                color: "black"
                anchors.centerIn: parent
            }
            MouseArea
                {
                    anchors.fill: parent
                    onPressed:
                    {
                        parent.color = "skyblue"
                        if (specialKeyTextId.text === "!#1")
                        {
                            isFirstSymbols = true
                            if (isCapitalized)
                            {
                                specialKeyTextId.text = "ABC"
                            }
                            else
                            {
                                specialKeyTextId.text = "abc"
                            }
                            shiftTextId.text = "1/2"
                        }
                        else
                        {
                            shiftTextId.text = "⇧"
                            specialKeyTextId.text = "!#1"
                            isFirstSymbols = false
                        }
                    }
                    onReleased:
                    {
                        parent.color = "white"
                    }
                }
        }
        Repeater
        {
            model: [
                { "key": "@", "width": 40, "height": 40 },
                { "key": " ", "width": 136, "height": 40 },
                { "key": "🌐", "width": 40, "height": 40 },
                { "key": ".", "width": 40, "height": 40 },
                { "key": "⏎", "width": 76, "height": 40 }]
            delegate: Rectangle {
                required property var modelData
                required property int index
                objectName: "second" + modelData
                width: modelData["width"]
                height: modelData["height"]
                color: 'white'
                Text
                {
                    id: fithBlockText
                    color:'black'
                    text: parent.modelData["key"]
                    anchors.centerIn: parent
                }
                radius: 4
                border.color: 'grey'
                MouseArea
                {
                    anchors.fill: parent
                    onPressed:
                    {
                        parent.color = "skyblue"
                        if (fithBlockText.text === "⏎")
                        {
                            addTextFieldContent("Enter")
                        }
                        else if (fithBlockText.text === "🌐")
                        {
                            addTextFieldContent("Close")
                        }
                        else
                        {
                            addTextFieldContent(fithBlockText.text)
                        }
                    }
                    onReleased:
                    {
                        parent.color = "white"
                    }
                }
            }
        }
    }
}
