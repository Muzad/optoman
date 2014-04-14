import QtQuick 2.0

Rectangle {
    id: root
    width: 350
    height: 550
    color: "lightblue"

    Rectangle {
        id: addButton
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width / 4
        height: parent.height / 8
        color: "black"
        MouseArea {
            anchors.fill: parent
            onClicked: root.state = "ADDSTATE"
        }
    }

    AddPage {
        id: addpage
       anchors.top : root.bottom
        width: parent.width
        height: parent.height
    }

    states: [
        State {
            name: "ADDSTATE"
            AnchorChanges {
                target: addpage
                anchors.top: root.top
            }
        }
    ]

    transitions: [
        Transition {
            from: ""
            to: "ADDSTATE"
            AnchorAnimation {
                duration: 300
                easing.type: Easing.InQuad
            }
        },
        Transition {
            from: "ADDSTATE"
            to: ""
            AnchorAnimation {
                duration: 300
                easing.type: Easing.OutBack
            }

        }
    ]

}
