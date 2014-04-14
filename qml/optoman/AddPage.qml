import QtQuick 2.0

Rectangle {
    color: "red"
    Rectangle {
        id: backButton
        anchors.top: parent.top
        anchors.left: parent.left
        width: parent.width / 4
        height: parent.height / 8
        color: "black"
        MouseArea {
            anchors.fill: parent
            onClicked: root.state = ""
        }
    }
}
