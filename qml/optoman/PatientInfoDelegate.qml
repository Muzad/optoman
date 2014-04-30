import QtQuick 2.0

Rectangle {
    width: 500
    height: 102

    property alias name: namePlaceText.text
    property alias phone: phonePlaceText.text
    property alias leftEye: leftEyePlaceText.text
    property alias rightEye: rightEyePlaceText.text
    property alias lensType: lensTypePlaceText.text
    property alias detail: detailPlaceText.text

    Rectangle {
        id: patientPersonalInfoPlace
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
        }
        height: parent.height / 4
        color: "#ab3636"

        Rectangle {
            id: namePlace
            anchors {
                top: parent.top
                bottom: parent.bottom
                left: parent.left
                right: parent.horizontalCenter
            }
            color: "#811199"
            Text {
                id: namePlaceText
                anchors.centerIn: parent
            }
        }

        Rectangle {
            id: phonePlace
            anchors {
                top: parent.top
                bottom: parent.bottom
                left: parent.horizontalCenter
                right: parent.right
            }
            color: "#818889"
            Text {
                id: phonePlaceText
                anchors.centerIn: parent
            }
        }
    }

    Rectangle {
        id: eyeInfoPlace
        anchors {
            left: parent.left
            right: parent.right
            top: patientPersonalInfoPlace.bottom
        }
        height: (parent.height / 4) * 2
        color: "#00db07"

        Rectangle {
            id: leftEyePlace
            anchors {
                left: parent.left
                right: parent.horizontalCenter
                top: parent.top
            }
            height: (parent.height / 5) * 3
            color: "green"
            Text {
                id: leftEyePlaceText
                anchors.centerIn: parent
            }
        }

        Rectangle {
            id: rightEyePlace
            anchors {
                left: parent.horizontalCenter
                right: parent.right
                bottom: parent.bottom
            }
            height: (parent.height / 5) * 3
            color: "red"
            Text {
                id: rightEyePlaceText
                anchors.centerIn: parent
            }
        }

    }

    Rectangle {
        id: typeAndDetailPlace
        anchors {
            left: parent.left
            right: parent.right
            top: eyeInfoPlace.bottom
            bottom: parent.bottom
        }
        height: parent.height / 4
        color: "#2b76ba"
        Rectangle {
            id: lensTypePlace
            anchors {
                top: parent.top
                bottom: parent.bottom
                left: parent.left
            }
            width: parent.width / 2
            color: "#000155"
            Text {
                id: lensTypePlaceText
                anchors.centerIn: parent
            }
        }

        Rectangle {
            id: detailPlace
            anchors {
                top: parent.top
                bottom: parent.bottom
                left: lensTypePlace.right
                right: parent.right
            }
            color: "#800029"
            Text {
                id: detailPlaceText
                anchors.centerIn: parent
            }
        }
    }
}
