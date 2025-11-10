import QtQuick 2.12
import QtQuick.Controls 2.15
import UI.Components 1.0

Window
{
    id: root 
    width: 419
    height: 290
    visible: true 
    title: "CustomKeyboardDemo"

    Label
    {
        id: labeledText
        text: "Text Field :"
        font
        {
           italic: true
           capitalization: Font.AllUppercase
        }
        anchors.horizontalCenter: root.left
    }

    CustomTextField
    {
        id: customTextField
        anchors.top: labeledText.bottom
        anchors.topMargin: 5
    }
}
