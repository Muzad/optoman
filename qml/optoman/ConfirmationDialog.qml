import QtQuick 2.1

Rectangle{
    id:root
    color: "#40000000"
    anchors.fill: parent
    enabled:  false
    opacity: 0

    signal accepted;
    signal rejected;

    property int fontSize: confirmation.width * 0.05
    property string recordId: ""

    MouseArea{
        anchors.fill: parent
        onClicked: root.hide()
    }

    function show(ID){
        root.state = "SHOW"
        root.recordId = ID
    }

    function hide(){
        root.state = ""
    }

//    Component.onCompleted: root.hide()

    Rectangle{
        id: confirmation
        width: parent.width * 0.9
        height: parent.height * 0.3
        anchors.centerIn: parent
        MouseArea{
            anchors.fill: parent
        }

        Column{
            anchors.fill: parent
            Item{
                width: parent.width
                height: parent.height /3
                Image {
                    id: trashIcon
                    source: "img/trash.png"
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width * 0.1
                    anchors.margins: parent.height * 0.3
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    id: title
                    text: qsTr("Delete")
                    font.pixelSize: parent.width * 0.06
                    height: parent.height
                    color: "#52aace"
                    font.bold: true
                    anchors.left: trashIcon.right
                    anchors.leftMargin: parent.width * 0.05
                    verticalAlignment: Text.AlignVCenter
                }
            }
            Rectangle{
                width: parent.width
                color: title.color
                height: 3
            }
            Item{
                width: parent.width
                height: parent.height / 3
                Text {
                    id:message
                    text: qsTr("Record will be deleted. Delete?")
                    verticalAlignment: Text.AlignVCenter
                    anchors.left: parent.left
                    font.bold: true
                    font.pixelSize: fontSize
                    height: parent.height
                    anchors.leftMargin: trashIcon.anchors.leftMargin
                }
            }
            Rectangle{
                width: parent.width
                color: "gray"
                height: 2
            }

            Row{
                width: parent.width
                height: parent.height/3
                    Text {
                        text: qsTr("No")
                        width: parent.width /2
                        font.pixelSize: fontSize
                        height: parent.height
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.bold: true
                        MouseArea{
                            anchors.fill: parent
                            onClicked: rejected();
                        }
                    }
                    Rectangle{
                        width: 2
                        height: parent.height
                        color: "gray"
                    }
                    Text {
                        font.bold: true
                        text: qsTr("Yes")
                        font.pixelSize: fontSize
                        width: parent.width /2
                        height: parent.height
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        MouseArea{
                            anchors.fill: parent
                            onClicked: accepted()
                        }
                    }
            }
        }
    }
    states: [
        State {
            name: "SHOW"
            PropertyChanges {target: root; enabled: true; opacity:1}
        }
    ]
    transitions: [
        Transition {
            from: "*"
            to: "SHOW"
            NumberAnimation { properties: "opacity"; duration: 50}
        }
    ]
}
