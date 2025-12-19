import QtQuick 2.12
import QtQuick.Dialogs
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import ConstantType 1.0

Dialog
{
    width: Constant.findAndReplaceDialog.setWidth
    height: Constant.findAndReplaceDialog.setHeight
    background: Rectangle
    {
        width: parent.width
        height: parent.height
        border.color: Constant.findAndReplaceDialog.borderColor
    }

    property var find: findId
    property var replace: replaceId
    signal changeContent(string findText, string replaceText)
    id: popDialogId

    header: Rectangle{
        width: parent.width
        height: Constant.findAndReplaceDialog.headerHeight
        border.width: Constant.findAndReplaceDialog.headerBorderWidth
        color: Constant.findAndReplaceDialog.headerColor
        border.color: Constant.findAndReplaceDialog.borderColor
        Image
        {
            source: Constant.findAndReplaceDialog.cancelImage.source
            width: Constant.findAndReplaceDialog.cancelImage.width
            height: Constant.findAndReplaceDialog.cancelImage.height
            anchors.verticalCenter: parent.verticalCenter
            x: Constant.findAndReplaceDialog.cancelImage.xPosition
            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    popDialogId.close()
                }
            }
        }
    }

    Row
    {
        id: findRowId
        spacing: findLabel.implicitWidth + Constant.findAndReplaceDialog.findRowSpacing
        Text
        {
            id: findLabel
            text: "Find"
            font.pointSize: Constant.findAndReplaceDialog.fontSize
        }
        TextField
        {
            id: findId
            font.pointSize: Constant.findAndReplaceDialog.fontSize
        }
    }

    Row
    {
        id: replaceRowId
        y: 60
        spacing: replaceLabel.implicitWidth - Constant.findAndReplaceDialog.replaceRowSpacing
        Text
        {
            id: replaceLabel
            text: "Replace"
            font.pointSize: Constant.findAndReplaceDialog.fontSize
        }
        TextField
        {
            id: replaceId
            font.pointSize: Constant.findAndReplaceDialog.fontSize
        }
    }

    RoundButton
    {
        width: Constant.findAndReplaceDialog.roundButton.setWidth
        height: Constant.findAndReplaceDialog.roundButton.setHeight
        text: "Replace All"
        x: Constant.findAndReplaceDialog.roundButton.xPosition
        y: Constant.findAndReplaceDialog.roundButton.yPosition
        onClicked:
        {
             changeContent(findId.text,replaceId.text)
        }
    }
}
