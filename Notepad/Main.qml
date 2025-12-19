import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Window 2.12
import ConstantType 1.0
import QtQuick.Layouts 1.3
import QtQuick.Dialogs
import "windowFunctions.js" as WindowFunctions


ApplicationWindow{

    id: window
    width: Constant.windowDimension.setWidth
    height: Constant.windowDimension.setHeight
    minimumHeight: Constant.windowDimension.setHeight
    minimumWidth: Constant.windowDimension.setWidth
    visible: Constant.windowDimension.setVisible

    property int count: 0
    property int currentCount: 0
    property int  currentLeftPage: 0
    property var list: []
    property int  leftArrowIncrement: 0

    FindAndReplacePopUp
    {
        id: findAndReplaceId
        anchors.centerIn: parent
        onChangeContent:
        {
            changeContent.connect(WindowFunctions.changeFindedValue)
        }
    }

    FileDialog {
        id: fileDialogId
        fileMode: FileDialog.OpenFile
        nameFilters: ["Text files (*.txt)", "All files (*)"]

        onAccepted: {
            WindowFunctions.setWindowTitle(selectedFile)
            WindowFunctions.destroyObject(count)
            list[count] = WindowFunctions.createObject()
            WindowFunctions.createTab(false)
        }
    }

    FileDialog {
        id: saveDialog
        title: "Save Dialog"
        fileMode: FileDialog.SaveFile
        nameFilters: ["Text files (*.txt)", "All files (*)"]
        defaultSuffix: "txt"

        onAccepted: {
            WindowFunctions.setWindowTitle(selectedFile)
            if (list[currentCount]) {
                list[currentCount].filePath = selectedFile
                file.updateValue(fileTextId.text, list[currentCount].filePath)
                if (list[currentCount].children && list[currentCount].children[0]) {
                    list[currentCount].children[0].text = window.title
                }
                list[currentCount].isEdited = false
            }
        }
    }


    menuBar: MenuBar {
        background: Rectangle {
            color: Constant.menuProperty.backGroundColor
            border.color: Constant.menuProperty.borderColor
        }

        Menu {
            title: "File"

            Action {
                text: "New"
                onTriggered: {
                    WindowFunctions.destroyObject(count)
                    list[count] = WindowFunctions.createObject()
                    WindowFunctions.createTab(true)
                }
            }

            Action {
                text: "Open"
                shortcut: "Ctrl+O"
                onTriggered: fileDialogId.open()
            }

            Action {
                text: "Save"
                shortcut: "Ctrl+S"
                onTriggered: {
                    var title = window.title.substring(0, 17)
                    if (title === "Untitled Document") {
                        saveDialog.open()
                    } else if (list[currentCount] && list[currentCount].filePath) {
                        file.updateValue(fileTextId.text, list[currentCount].filePath)
                        list[currentCount].isEdited = false
                    }
                }
            }

            Action {
                text: "Save As"
                onTriggered: saveDialog.open()
            }

            MenuSeparator { }

            Action {
                text: "Quit"
                onTriggered: Qt.quit()
            }
        }

        Menu {
            title: "View"

            Action {
                text: "Find and Replace"
                shortcut: "Ctrl+F"
                onTriggered: findAndReplaceId.open()
            }
        }
    }

    Image
    {
        id: leftArrowId
        width: Constant.imageProperty.setWidth
        height: Constant.imageProperty.setHeight
        source: Constant.imageProperty.leftArrowSource
        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                if(((tabContainerId.implicitWidth) - (212 * leftArrowIncrement)) > (window.width - 100))
                {
                    leftArrowIncrement++;
                    tabContainerId.x = tabContainerId.x - 212
                }
            }
        }
    }

    Rectangle
    {
        id: tabBorderId
        width: parent.width - Constant.tabContainerProperty.lessWidth
        height: Constant.tabContainerProperty.setHeight
        border.color: Constant.tabContainerProperty.color
        border.width: Constant.tabContainerProperty.borderWidth
        clip: true
        anchors.left: leftArrowId.right
        RowLayout
        {
            id: tabContainerId
            Layout.fillWidth: true
            height: parent.height
            spacing: Constant.tabContainerProperty.spacing
            width: window.implicitWidth
        }
    }

    Image
    {
        id: rightArrowId
        width: Constant.imageProperty.setWidth
        height: Constant.imageProperty.setHeight
        source: Constant.imageProperty.leftArrowSource
        mirror: true
        anchors.left: tabBorderId.right
        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                if(leftArrowIncrement > 0)
                {
                    tabContainerId.x += 212
                    leftArrowIncrement --
                }
            }
        }
    }

    ScrollView
    {
        width: parent.width
        height: parent.height - Constant.scrollBar.lessHeight
        y: Constant.scrollBar.yPosition
        ScrollBar.vertical.width: Constant.scrollBar.verticalWidthAndHeight
        ScrollBar.horizontal.height: Constant.scrollBar.verticalWidthAndHeight
        ScrollBar.vertical.policy: ScrollBar.AlwaysOn
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOn
        TextArea
        {
            id: fileTextId
            width: parent.width
            height: parent.height
            selectByMouse: true
            text:""
            font.pointSize: Constant.textAreaFontsize
            Keys.onPressed:
            {
                if (list[currentCount]) {
                    list[currentCount].isEdited = true
                }
            }
            Connections
            {
                target: file
                function onValueChanged(message) {
                    fileTextId.text = fileTextId.text + message;
                }
            }
            onEditingFinished:
            {
                if (list[currentCount]) {
                    list[currentCount].contentText = fileTextId.text
                }
            }
        }
    }

    footer: Rectangle
    {
        color: Constant.footerProperty.color
        border.color: Constant.footerProperty.borderColor
        width: parent.width
        height: Constant.footerProperty.height
        Text
        {
            text: "line :"+WindowFunctions.getLine()+" col :"+WindowFunctions.getColumn()
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: Constant.footerProperty.textFontSize
            font.italic: true
        }
    }

    Component.onCompleted:
    {
        list[count] = WindowFunctions.createObject()
        if (list[count]) {
            WindowFunctions.createTab(true)
        }
    }
}
