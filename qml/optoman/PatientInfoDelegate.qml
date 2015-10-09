import QtQuick 2.1

Image {
    source: "img/itemBack.png"
    property alias nameText: namePlaceText.text
    property alias phoneText: phonePlaceText.text
    property alias leftEyeText: leftEyePlaceText.text
    property alias rightEyeText: rightEyePlaceText.text
//    property alias lensTypeText: lensTypePlaceText.text
//    property alias detailText: detailPlaceText.text
    property alias dayValue: dayText.text
    property alias monthValue: monthText.text
    property alias yearValue: yearText.text

    property int fontSize: width * 0.04

//    LayoutMirroring.enabled: true
//    LayoutMirroring.childrenInherit: true

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
                font.pixelSize: dayPlace.height / 1.3
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
                font.pixelSize: monthPlace.height / 1.3
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
                font.pixelSize: yearPlace.height / 1.8
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
        height: parent.height / 2

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
        height: parent.height / 2

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

//    Item {
//        id: typeAndDetailPlace
//        anchors {
//            left: parent.left
//            right: parent.right
//            top: eyeInfoPlace.bottom
//            bottom: parent.bottom
//        }
////        height: parent.height / 4
//        Item {
//            id: lensTypePlace
//            anchors {
//                top: parent.top
//                bottom: parent.bottom
//                left: parent.left
//            }
//            width: parent.width / 2
//            Text {
//                id: lensTypePlaceText
//                anchors.centerIn: parent
//            }
//        }

//        Item {
//            id: detailPlace
//            anchors {
//                top: parent.top
//                bottom: parent.bottom
//                left: lensTypePlace.right
//                right: parent.right
//            }
//            Text {
//                id: detailPlaceText
//                anchors.centerIn: parent
//            }
//        }
//    }
}
