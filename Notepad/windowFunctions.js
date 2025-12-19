function setWindowTitle(fileUrl)
{
    var filepath = String(fileUrl)
    var filename = ""
    for(var index = filepath.length - 1; index >= 0 && filepath.charAt(index) != '/'; index--)
    {
        filename += filepath.charAt(index);
    }
    var title = ""
    for(var i = filename.length - 1; i >= 0; i--)
    {
        title += filename.charAt(i);
    }

    window.title = title;
}

function createObject()
{
    var component = Qt.createComponent("NewTab.qml");

    if (component.status === Component.Error) {
        console.error("Error loading NewTab.qml:", component.errorString());
        return null;
    }

    if (component.status === Component.Loading) {
        console.log("NewTab.qml is still loading...");
        return null;
    }

    if (component.status === Component.Ready) {
        var obj = component.createObject(tabContainerId, {});
        if (obj === null) {
            console.error("Failed to create object from NewTab.qml");
        }
        return obj;
    }

    console.error("Unknown component status:", component.status);
    return null;
}

function createTab(isNew)
{
    if (!list[count]) {
        console.error("Tab object is null");
        return;
    }

    fileTextId.clear()
    if(isNew === false)
    {
        file.changeValue(fileDialogId.selectedFile)
        list[count].isEdited = false
        list[count].filePath = fileDialogId.selectedFile
        if (list[count].children && list[count].children[0]) {
            list[count].children[0].text = window.title
        }
    }
    list[count].count = count
    list[count].rightNeigbhour = count + 1
    list[count].leftNeigbhour = currentLeftPage - 1

    if (list[currentCount] && list[currentCount].backGround) {
        list[currentCount].backGround.color = "grey"
    }
    if (list[count] && list[count].backGround) {
        list[count].backGround.color = "#fce68d"
    }
    if (list[count]) {
        list[count].contentText = fileTextId.text
    }
    if (list[count] && list[count].children && list[count].children[0]) {
        window.title = list[count].children[0].text
    }
    currentCount = count
    currentLeftPage++
    count++
}

function neigbhourTab(neigbhour, tabCount, isCornerTab)
{
    if (!list[tabCount]) return;

    if(neigbhour === 'rightNeigbhour' && isCornerTab === true)
    {
        list[tabCount].leftNeigbhour = -1
    }
    if(neigbhour === 'leftNeigbhour' && isCornerTab === true)
    {
        list[tabCount].rightNeigbhour = -1
    }
    if (list[tabCount].children && list[tabCount].children[0]) {
        window.title = list[tabCount].children[0].text
    }
    fileTextId.text = list[tabCount].contentText || ""
    currentCount = list[tabCount].count
    if (list[currentCount] && list[currentCount].backGround) {
        list[currentCount].backGround.color = "#fce68d"
    }
}

function leftAndRightNeigbhourTab(leftNeigbhour, rightNeigbhour, isNeigbhourTabFound)
{
    if(list[leftNeigbhour] != null)
    {
        list[leftNeigbhour].rightNeigbhour = rightNeigbhour
        neigbhourTab("leftNeigbhour",leftNeigbhour,false)
        isNeigbhourTabFound = true
    }
    if(list[rightNeigbhour] != null)
    {
        list[rightNeigbhour].leftNeigbhour = leftNeigbhour
        if(isNeigbhourTabFound === false)
        {
            neigbhourTab("rightNeigbhour",rightNeigbhour,false)
            isNeigbhourTabFound = true
        }
    }
    return isNeigbhourTabFound
}

function checkTabContainer(currentPage,isNeigbhourTabFound)
{
    if(leftArrowIncrement > 0)
    {
        tabContainerId.x = tabContainerId.x + 212
        leftArrowIncrement --;
    }
    if(currentPage === currentLeftPage)
    {
        currentLeftPage--;
    }
    if(isNeigbhourTabFound === false)
    {
        Qt.quit()
    }
}

function destroyObject(tabCount)
{
    if( list[tabCount] != null)
    {
        let leftNeigbhour = list[tabCount].leftNeigbhour
        let rightNeigbhour = list[tabCount].rightNeigbhour
        let isNeigbhourTabFound = false
        let currentPage = currentCount
        fileTextId.clear()

        if (list[currentCount] && list[currentCount].backGround) {
            list[currentCount].backGround.color = "grey"
        }

        if(tabCount === 0 && list[rightNeigbhour] != null )
        {
            neigbhourTab("rightNeigbhour",rightNeigbhour,true)
            isNeigbhourTabFound = true
        }
        else if(tabCount === (count - 1) && list[leftNeigbhour] != null)
        {
            neigbhourTab("leftNeigbhour",leftNeigbhour,true)
            isNeigbhourTabFound = true
        }
        else
        {
           isNeigbhourTabFound = leftAndRightNeigbhourTab(leftNeigbhour, rightNeigbhour, isNeigbhourTabFound)
        }

        if (list[tabCount]) {
            list[tabCount].destroy()
        }
        checkTabContainer(currentPage,isNeigbhourTabFound)
    }
}

function  setContent(content,count)
{
    if (list[currentCount] && list[currentCount].backGround) {
        list[currentCount].backGround.color = "grey"
    }
    currentCount = count
    if (list[count] && list[count].children && list[count].children[0]) {
        window.title = list[count].children[0].text
    }
    if (list[currentCount] && list[currentCount].backGround) {
        list[currentCount].backGround.color = "#fce68d"
    }
    fileTextId.clear()
    fileTextId.text = content
}

function changeFindedValue(string1, string2)
{
    var contentText = fileTextId.text
    for(let index = 0; index < contentText.length; index++)
    {
        contentText = contentText.replace(string1, string2)
    }
    fileTextId.clear()
    fileTextId.text = contentText
    findAndReplaceId.changeContent.disconnect(changeFindedValue)
    findAndReplaceId.close()
}

function getText()
{
    let string = fileTextId.text
    let subString = string.substring(0,fileTextId.cursorPosition)
    let contentText = subString.split('\n')
    return contentText;
}

function getLine()
{
    let contentText = getText();
    return contentText.length
}

function getColumn()
{
    let contentText = getText();
    let length = contentText.length
    return contentText[length - 1].length + 1;
}


function saveContent()
{
    var title = window.title
    title = title.substring(0,17)

    if(title === "Untitled Document")
    {
        saveDialog.open()
    }
    if (list[currentCount] && list[currentCount].filePath) {
        file.updateValue(fileTextId.text, list[currentCount].filePath)
        list[currentCount].isEdited = false
    }
}

function openSaveAsDialog()
{
    saveDialog.open()
}
