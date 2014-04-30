import QtQuick 2.1

Rectangle {
    id: root
    width: 350
    height: 550
    color: "lightblue"

    ListView {
        id: mainView
        anchors.fill: parent
        property int w: parent.width
        property int h: parent.height / 7
        model: patientmodel
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
