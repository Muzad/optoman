import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

Window {
    visible: true
    width: 350
    height: 550

    function hideVirtualKeyboard(){
        Qt.inputMethod.hide();
    }

    Item{
        id: root
        anchors.fill: parent

        Rectangle {
            id:searchBar
            width: parent.width
            height: parent.height /9
            color: "#3498DB"

            Image {
                id: searchImg
                source: "img/search.png"
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.margins: 10
                fillMode: Image.PreserveAspectFit
            }
            TextField {
                id: searchField
                height: parent.height
                anchors.left: searchImg.right
                anchors.right: parent.right
                anchors.rightMargin: 15
                placeholderText: "Search By Name"
                font.pixelSize: 18
                inputMethodHints: Qt.ImhNoPredictiveText
                onTextChanged: DBMAN.reloadModel(searchField.text,searchField.text)

                style: TextFieldStyle {
                    textColor: "white"
                    placeholderTextColor: "lightgray"
                    background: Item {
                        implicitWidth: 100
                        implicitHeight: 24
                    }
                }
            }
            Rectangle{
                color: "lightgray"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.leftMargin: 25
                anchors.rightMargin: anchors.leftMargin
                anchors.bottomMargin: 10
                height: 1
            }
        }

        Rectangle{
            anchors.top:searchBar.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            color: "orange"

            ListView {
                id: mainView
                anchors.fill: parent
                property int w: parent.width
                property int h: parent.height / 7
                model: patientmodel
                clip: true
                delegate: PatientInfoDelegate {
                    width: mainView.w
                    height: mainView.h

                    dayValue:   helper.gregorianToJalali(date).substr(8,2)
                    monthValue: helper.gregorianToJalali(date).substr(5,2)
                    yearValue:  helper.gregorianToJalali(date).substr(0,4)

                    nameText: name
                    phoneText: phone
                    leftEyeText: leftEyeSph + "  " + leftEyeCyl + " @" + leftEyeAx
                    rightEyeText: rightEyeSph + "  " + rightEyeCyl + " @" + rightEyeAx
//                    lensTypeText: lensType
//                    detailText: detail
                }
            }

            Rectangle {
                id: addButton
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                anchors.margins: width / 2.7
                color: "#3498DB"
                width: parent.width * 0.2
                height: width
                radius: width/2
                Image {
                    id: plusImg
                    anchors.centerIn: parent
                    source: "img/plus.png"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        addpage.clear()
                        root.state = "ADDSTATE"
                    }
                }
            }

            DropShadow {
                anchors.fill: addButton
                source: addButton
                horizontalOffset: 5
                verticalOffset: 7
                radius: 5
                samples: 30
                color: "#50000000"
            }

        }

        AddPage {
            id: addpage
            anchors.top : root.bottom
            width: parent.width
            height: parent.height
        }

        ConfirmationDialog{
            id: confirmationDialog

            onAccepted: {
                DBMAN.deleteRecord(recordId)
                DBMAN.reloadModel()
                hide()
            }
            onRejected: hide()
        }

        states: [
            State {
                name: "ADDSTATE"
                AnchorChanges {target: addpage; anchors.top: root.top}
            }
        ]

        transitions : [
            Transition {
                from: ""
                to: "ADDSTATE"
                AnchorAnimation {duration: 300; easing.type: Easing.InQuad}
            },
            Transition {
                from: "ADDSTATE"
                to: ""
                AnchorAnimation {duration: 300; easing.type: Easing.OutBack}
            }
        ]
    }
}
