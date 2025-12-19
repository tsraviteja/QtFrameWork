import QtQuick 2.12
import QtQuick.Controls 2.5
import ConstantType 1.0
import "windowFunctions.js" as WindowFunctions

Item
{
    width: 212
    height: 30
    property int count
    property url filePath
    property int leftNeigbhour
    property int rightNeigbhour
    property string contentText: ""
    property bool isEdited: true
    property var backGround: backGroundId

    TabButton
    {
        width: parent.width
        height: parent.height
        text: "Untitled Document"+count+"*"
        font.italic: true
        background: Rectangle
        {
            id: backGroundId
            color: Constant.tabProperty.color[1]
        }
        onClicked:
        {

            WindowFunctions.setContent(contentText,count)
        }
        Image
        {
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            width: Constant.tabProperty.fileImage.setWidth
            height: Constant.tabProperty.fileImage.setHeight
            source: Constant.tabProperty.fileImage.source
        }
        Image
        {
            anchors.verticalCenter: parent.verticalCenter
            width: Constant.tabProperty.cancelImage.setWidth
            height: Constant.tabProperty.cancelImage.setHeight
            x: Constant.tabProperty.cancelImage.xPosition
            source: Constant.tabProperty.cancelImage.source
            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    if(isEdited === true)
                    {
                        dialogId.open()
                    }
                    else
                    {
                        WindowFunctions.destroyObject(count)
                    }
                }
            }
        }
    }

    PopUpDialog
    {
        id: dialogId
        anchors.centerIn: parent
        onIsCancel:
        {
            WindowFunctions.destroyObject(count)
        }
        onIsSave:
        {
            WindowFunctions.saveContent();
            dialogId.close()
        }
        onIsSaveAs:
        {
            WindowFunctions.openSaveAsDialog()
            dialogId.close()
        }
    }
}
