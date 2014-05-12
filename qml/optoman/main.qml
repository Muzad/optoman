import QtQuick 2.1
import QtQuick.Controls 1.1

Rectangle {
    id: root
    width: 350
    height: 550
    color: "lightblue"

    Row {
        id:searchBar
        width: parent.width / 1.2
        height: parent.height /9

        TextField {
            id: searchField
            width: parent.width / 1.1
            height: parent.height
            placeholderText: "Search By Name"
        }

        Button {
            id: searchButton
            width: parent.width / 3.1
            height: parent.height
            text: "Search!"
            onClicked: {
                DBMAN.reloadModel(searchField.text,searchField.text)
            }
        }
    }

    ListView {
        id: mainView
        anchors.top: searchBar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        property int w: parent.width
        property int h: parent.height / 7
        model: patientmodel
        clip: true
        delegate: PatientInfoDelegate {
            width: mainView.w
            height: mainView.h

            nameText: name
            phoneText: phone
            leftEyeText: leftEyeSph + " " + leftEyeCyl + " @" + leftEyeAx
            rightEyeText: rightEyeSph + " " + rightEyeCyl + " @" + rightEyeAx
            lensTypeText: lensType
            detailText: detail
        }

    }

    Item {
        id: addButton
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width / 4
        height: width
        Image {
            anchors.fill: parent
            source: "img/up.png"
            smooth: true
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                addpage.clear()
                root.state = "ADDSTATE"
            }
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
