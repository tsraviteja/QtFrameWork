import QtQuick 2.12
import QtQuick.Controls 2.5
import ConstantType 1.0

Dialog
{
    signal isCancel()
    signal isSave()
    signal isSaveAs()

    title: "Alert Message"
    width: Constant.popDailogProperty.setWidth
    height: Constant.popDailogProperty.setHeight
    modal: true

    background: Rectangle{
        width: parent.width
        height: parent.height
        border.color: Constant.popDailogProperty.borderColor
    }

    Text
    {
        id: textMessageId
        text: "do you want to save this content?"
        font.pointSize: Constant.popDailogProperty.fontSize
        x: Constant.popDailogProperty.textPosition
    }
    Rectangle
    {
        id:cancelId
        width: Constant.popDailogProperty.button.setWidth
        height: Constant.popDailogProperty.button.setHeight
        radius: Constant.popDailogProperty.button.radius
        border.color: Constant.popDailogProperty.button.borderColor
        x: Constant.popDailogProperty.cancelButton.xPosition
        y: Constant.popDailogProperty.button.yPosition
        Text
        {
            text: "Close"
            color: Constant.popDailogProperty.button.textColor
            anchors.centerIn: parent
            font.pointSize: Constant.popDailogProperty.fontSize
        }
        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                isCancel()
                close()
            }
        }
    }
    Rectangle
    {
        id: saveId
        width: Constant.popDailogProperty.button.setWidth
        height: Constant.popDailogProperty.button.setHeight
        radius: Constant.popDailogProperty.button.radius
        border.color: Constant.popDailogProperty.button.borderColor
        x: cancelId.x + Constant.popDailogProperty.saveButton.xPosition
        y: Constant.popDailogProperty.button.yPosition
        Text
        {
            text: "Save"
            color: Constant.popDailogProperty.button.textColor
            anchors.centerIn: parent
            font.pointSize: Constant.popDailogProperty.fontSize
        }
        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                isSave()
                close()
            }
        }
    }
    Rectangle
    {
        id: saveAsId
        width: Constant.popDailogProperty.button.setWidth
        height: Constant.popDailogProperty.button.setHeight
        radius: Constant.popDailogProperty.button.radius
        border.color: Constant.popDailogProperty.button.borderColor
        x: saveId.x + Constant.popDailogProperty.saveAsButton.xPosition
        y: Constant.popDailogProperty.button.yPosition
        Text
        {
            text: "SaveAs"
            color: Constant.popDailogProperty.button.textColor
            anchors.centerIn: parent
            font.pointSize: Constant.popDailogProperty.fontSize
        }
        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                isSaveAs()
                close()
            }
        }
    }
}
