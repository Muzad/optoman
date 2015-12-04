import QtQuick 2.1
import QtQuick.Controls 1.4
//import QtQuick.Controls.Styles 1.1

import "control" as EyeControl

Rectangle {
    id:addPageRoot
    width: 350
    height: 550

    MouseArea{
        anchors.fill: parent
        onClicked: hideVirtualKeyboard()
    }

    Rectangle {
        id: topBar
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height / 9
        color: "#3498DB"

        MouseArea{
            anchors.fill: parent
            onClicked: hideVirtualKeyboard()
        }

        Item {
            id: backButton
            height: parent.height
            width: height
            anchors.left: parent.left

            Image{
                anchors.centerIn: parent
                smooth: true
                height: parent.height * 0.35
                fillMode: Image.PreserveAspectFit
                source: "img/back.png"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    hideVirtualKeyboard()
                    DBMAN.reloadModel()
                    addPageRoot.hide()
                }
            }
        }

        Item{
            height: parent.height
            width: height
            anchors.right: parent.right
            Image {
                id: saveButton
                anchors.centerIn: parent
                smooth: true
                height: parent.height * 0.5
                fillMode: Image.PreserveAspectFit
                source: "img/ok.png"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    hideVirtualKeyboard()
                    DBMAN.addInfo( "8888", customerName.text, customerPhone.text,
                                  leftEye.sphValue(), leftEye.cylValue(), leftEye.axValue(),
                                  rightEye.sphValue(), rightEye.cylValue(), rightEye.axValue(),
                                  lensType.text, detailArea.text, false)
                    DBMAN.reloadModel()
                    addPageRoot.hide()
                }
            }
        }
    }

    Column {
        anchors {
            top: topBar.bottom
            topMargin: 10
            left: parent.left
            leftMargin: 4
            rightMargin: 4
            right: parent.right
            bottom: parent.bottom
        }
        spacing: height * 0.015 //9
        TextField {
            id: customerName
            width: parent.width / 1.2
            height: parent.height /9
            placeholderText: "Name"
            anchors.horizontalCenter: parent.horizontalCenter
            inputMethodHints: Qt.ImhNoPredictiveText
        }

        TextField {
            id: customerPhone
            width: parent.width / 1.2
            height: parent.height /9
            inputMethodHints: Qt.ImhDigitsOnly
            placeholderText: "Phone"
            anchors.horizontalCenter: parent.horizontalCenter
            maximumLength: 11
        }

        TextField {
            id: lensType
            width: parent.width / 1.2
            height: parent.height /9
            placeholderText: "Lens Type"
            anchors.horizontalCenter: parent.horizontalCenter
            inputMethodHints: Qt.ImhNoPredictiveText
        }

        Item{
            id: eyesRow
            property real spacing: width * 0.03
            width: parent.width
            height: parent.height*0.35

            EyeControl.EyeReel{
                id:leftEye
                width: parent.width /2 - parent.spacing
                height: parent.height

                anchors.left: parent.left
                anchors.leftMargin: 5
            }

            EyeControl.EyeReel{
                id: rightEye
                width: leftEye.width
                height: leftEye.height
                anchors.right: parent.right
                anchors.rightMargin: leftEye.anchors.leftMargin
            }
        }

        TextArea {
            id: detailArea
            width: parent.width * 0.9
            height: parent.height * 0.22
            anchors.horizontalCenter: parent.horizontalCenter
            inputMethodHints: Qt.ImhNoPredictiveText;
            textMargin: 10

            Label{
                id: placeHolderText
                text: "Detail"
                anchors.fill: parent
                anchors.margins: parent.textMargin
                color: "gray"
                visible: parent.text === ""
            }
        }
    }

    function clear(){
        customerName.text = customerPhone.text = lensType.text = detailArea.text = ""
        leftEye.reset()
        rightEye.reset()
    }

    function show(){
        addPageRoot.clear()
        addPageRoot.state = "SHOW"
        openPagesList.push(this)
    }

    function hide(){
        addPageRoot.state = ""
        openPagesList.pop()
    }

    states: [
        State {
            name: "SHOW"
            AnchorChanges {target: addPageRoot; anchors.left: root.left}
            PropertyChanges {target: addPageRoot; opacity: 1}
        }
    ]

    transitions : [
        Transition {
            from: ""
            to: "SHOW"
            reversible: true
            AnchorAnimation {duration: 300; easing.type: Easing.InOutExpo}
            PropertyAnimation{property: "opacity"; duration: 250}
        }
    ]
}
