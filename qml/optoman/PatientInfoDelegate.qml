import QtQuick 2.1

Image{
    id: root
    source:"img/itemBack.png"
    property alias nameText: namePlaceText.text
    property alias phoneText: phonePlaceText.text
    property alias leftEyeText: leftEyePlaceText.text
    property alias rightEyeText: rightEyePlaceText.text
    property string lensTypeText: ""
    property alias detailText: detailPlaceText.text
    property alias dayValue: dayText.text
    property alias monthValue: monthText.text
    property alias yearValue: yearText.text

    property int fontSize: width * 0.04
    property int rowHeight: ListView.view.h / 2
    property int test: ListView.view.h
    LayoutMirroring.enabled: ListView.view.rtl
    LayoutMirroring.childrenInherit: true
    MouseArea{
        id: itemMouseArea
        anchors.fill: parent
        onPressAndHold: confirmationDialog.show(ID)
        onClicked: {
            root.state = (root.state === "EXPAND")? "" :"EXPAND"
        }
    }

    Column {
        id: datePlace
        anchors.right: parent.right
        width: parent.width / 8
        height: parent.height

        Rectangle {
            id: dayPlace
            width: parent.width
            height: parent.height / 3
            color: "red"
            Text {
                id: dayText
//                text: qsTr("23")
                anchors.centerIn: parent
                font.pixelSize: fontSize * 1.2
                font.bold: true
            }
        }

        Rectangle {
            id: monthPlace
            width: parent.width
            height: parent.height / 3
            color: "green"
            Text {
                id: monthText
//                text: qsTr("12")
                anchors.centerIn: parent
                font.pixelSize: fontSize * 1.2
                font.bold: true
            }
        }

        Rectangle {
            id: yearPlace
            width: parent.width
            height: parent.height / 3
            color: "blue"

            Text {
                id: yearText
//                text: qsTr("1365")
                anchors.centerIn: parent
                font.pixelSize: fontSize
                font.bold: true
            }
        }
    }

    Item {
        id: patientPersonalInfoPlace
        anchors {
            left: parent.left
            right: datePlace.left
            top: parent.top
        }
        height: rowHeight

        Item {
            id: namePlace
            anchors {
                top: parent.top
                bottom: parent.bottom
                left: parent.left
                right: parent.horizontalCenter
            }
            Text {
                id: namePlaceText
//                anchors.verticalCenter: parent.verticalCenter
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.leftMargin: parent.width * 0.1
                font.pixelSize: fontSize * 1.2
                font.bold: true
                font.italic: true
            }
        }

        Item {
            id: phonePlace
            anchors {
                top: parent.top
                bottom: parent.bottom
                left: parent.horizontalCenter
                right: parent.right
            }
            Text {
                id: phonePlaceText
//                anchors.verticalCenter: parent.verticalCenter
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.leftMargin: namePlaceText.anchors.leftMargin
                font.pixelSize: fontSize
            }
        }
    }

    Item {
        id: eyeInfoPlace
        anchors {
            left: parent.left
            right: datePlace.left
            top: patientPersonalInfoPlace.bottom
        }
        height: rowHeight

        Item{
            id: leftEyePlace
            anchors {
                left: parent.left
                right: parent.horizontalCenter
                bottom: parent.bottom
                top: parent.top
            }
            Text {
                id: leftEyePlaceText
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: namePlaceText.anchors.leftMargin
                font.pixelSize: fontSize
            }
        }

        Item{
            id: rightEyePlace
            anchors {
                left: leftEyePlace.right
                right: parent.right
                bottom: parent.bottom
                top: parent.top
            }
            Text {
                id: rightEyePlaceText
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: namePlaceText.anchors.leftMargin
                font.pixelSize: fontSize
            }
        }

    }

    Item {
        id: typePlace
        opacity: 0
        anchors {
            left: parent.left
            right: parent.right
            top: eyeInfoPlace.bottom
        }
        height: lensTypePlaceText.text===""? 0 :rowHeight * 0.7

        Text {
            id: lensTypePlaceText
            text: lensTypeText === ""? "" :"Lens Type: " + lensTypeText
            font.italic: true
            anchors.left: parent.left
            anchors.leftMargin: namePlaceText.anchors.leftMargin
        }
    }

    Item {
        id: detailPlace
        opacity: 0
        anchors {
            left: parent.left
            right: datePlace.left
            top: typePlace.bottom
            leftMargin: namePlaceText.anchors.leftMargin
            rightMargin: anchors.leftMargin
        }
        height: detailPlaceText.text===""? 0 :detailPlaceText.implicitHeight + anchors.leftMargin
        Text {
            id: detailPlaceText
            wrapMode: Text.WordWrap
            anchors.left: parent.left
            anchors.right: parent.right
            font.italic: true
            horizontalAlignment: Text.AlignJustify
        }
    }

    Rectangle{              //Dim layer
        color: "black"
        opacity: 0.2
        visible: itemMouseArea.pressed? true :false
        anchors.fill: parent
    }

    states: [
        State {
            name: "EXPAND"
            PropertyChanges {target: root; height:patientPersonalInfoPlace.height + eyeInfoPlace.height + typePlace.height + detailPlace.height}
            PropertyChanges {target: typePlace; opacity:1}
            PropertyChanges {target: detailPlace; opacity:1}
        }
    ]
    transitions: [
        Transition {
            NumberAnimation{properties: "height, opacity";duration: 100; easing.type: Easing.InOutExpo}
        }
    ]


}
