import QtQuick 2.1
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
import "control" as EyeControl

Item {
    id:addPageRoot
    width: 350
    height: 550

    function clear()
    {
        customerName.text = ""
        customerPhone.text = ""
        lensType.text = ""
        leftEyeReel.clear()
        rightEyeReel.clear()
        detailArea.text = ""

    }

    Image {
        source: "img/background.png"
        anchors.fill: parent
    }

    Item {
        id: topBar
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height / 9
        Image {
            id: name
            anchors.fill: parent
            source: "img/toolBar.png"
        }

        Image {
            id: backButton
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 15
            anchors.left: parent.left
            smooth: true
            width: height * 1.5
            height: parent.height/ 1.4
            source: "img/back.png"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    DBMAN.reloadModel()
                    root.state = ""
                }
            }
        }
        Image {
            id: saveButton
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 15
            anchors.right: parent.right
            smooth: true
            width: height * 1.5
            height: parent.height/ 1.4
            source: "img/done.png"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    DBMAN.addInfo( "8888", customerName.text, customerPhone.text, leftEyeReel.sphValue, leftEyeReel.cylValue, leftEyeReel.axValue, rightEyeReel.sphValue, rightEyeReel.cylValue, rightEyeReel.axValue, lensType.text, detailArea.text, false)
                    DBMAN.reloadModel()
                    root.state = ""
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
        spacing: 9
        TextField {
            id: customerName
            width: parent.width / 1.2
            height: parent.height /9
            placeholderText: "Name"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        TextField {
            id: customerPhone
            width: parent.width / 1.2
            height: parent.height /9
            inputMethodHints: Qt.ImhDigitsOnly
            placeholderText: "Phone"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        TextField {
            id: lensType
            width: parent.width / 1.2
            height: parent.height /9
            placeholderText: "Lens Type"
            anchors.horizontalCenter: parent.horizontalCenter
        }



        Row {
            id: rightEyeRow
            width: parent.width / 1.3
            anchors.right: parent.right
            Column {
                id: rightEyePicker
                width: parent.width - (parent.width/6)
                Row {
                    width: parent.width
                    Text {
                        id: rightSphText
                        width: (parent.width-2*parent.spacing)*0.27
                        text: "SPH"
                        color: "#666666"
                    }
                    Text {
                        id: rightCylText
                        width: (parent.width-2*parent.spacing)*0.27
                        text: "CYL"
                        color: "#666666"
                    }
                    Text {
                        width: (leftEyeReel.height +3)
                        text: ""
                        color: "#666666"
                    }
                    Text {
                        id: rightAxText
                        width: (parent.width-2*parent.spacing)*0.27
                        text: "AX"
                        color: "#666666"
                    }
                }
                EyeControl.EyeReel {
                    id: rightEyeReel
                    width: parent.width
                    height: addPageRoot.height / 8
                }
            }
            Rectangle {
                color: "gray"
                border.width: 4
                border.color: "#362a2a"
                radius: 25
                width: parent.width / 6
                height: parent.height
                Text {
                    anchors.centerIn: parent
                    text: qsTr("Right \nEye")
                    color: "yellow"
                    font.bold: true
                    font.pixelSize: parent.height / 6
                    font.family: "Droid Serif"
                }
            }
        }

        Row {
            id: leftEyeRow
            width: parent.width
            Rectangle {
                color: "gray"
                border.width: 4
                border.color: "#362a2a"
                radius: 25
                width: parent.width / 8
                height: parent.height
                Text {
                    anchors.centerIn: parent
                    text: qsTr("Left \nEye")
                    color: "yellow"
                    font.bold: true
                    font.pixelSize: parent.height / 6
                    font.family: "Droid Serif"
                }
            }

            Column {
                id: leftEyePicker
                width: parent.width / 1.6
                Row {
                    width: parent.width
                    Text {
                        id: leftSphText
                        width: (parent.width-2*parent.spacing)*0.27
                        text: "SPH"
                        color: "#666666"
                    }
                    Text {
                        id: leftCylText
                        width: (parent.width-2*parent.spacing)*0.27
                        text: "CYL"
                        color: "#666666"
                    }
                    Text {
                        width: (leftEyeReel.height +3)//-2*parent.spacing)*0.27
                        text: ""
                        color: "#666666"
                    }
                    Text {
                        id: leftAxText
                        width: (parent.width-2*parent.spacing)*0.27
                        text: "AX"
                        color: "#666666"
                    }
                }
                EyeControl.EyeReel {
                    id: leftEyeReel
                    width: parent.width
                    height: addPageRoot.height / 8
                }
            }
        }

        TextArea {
            id: detailArea
            width: parent.width
            height: parent.height / 4
        }
    }

}
