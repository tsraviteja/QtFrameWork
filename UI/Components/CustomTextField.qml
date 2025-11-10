import QtQuick
import QtQuick.Controls

Rectangle
{
    id: customTextField
    width: parent.width / 2
    height: 45

    property string textFieldContent: textField.text
    property string placeholder: ""
    
    function updateTextField(content)
    {
        if (content === "⌫")
        {
            textField.remove(textField.text.length, textField.text.length-1)
        }
        else if (content === "Enter" || content === "Close")
        {
            loadKeyboard.source = ""
            customTextField.height = 45
        }
        else
        {
            const position = textField.cursorPosition
            textField.insert(position, content)
        }
    }
    
    Loader
    {
        id: loadKeyboard
        
        onLoaded:
        {   anchors.top = textField.bottom
            anchors.topMargin = 5
            item.addTextFieldContent.connect(updateTextField)
        }
    }
    
    TextField
    {
        id: textField
        width: customTextField.width
        height: 45
        placeholderText: placeholder
        onPressed: 
        {
            loadKeyboard.source = "../Keyboard/CustomKeyboard.qml"
            customTextField.height = 270
        }
    }
}
