import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

Window{
    id: mainWindow
    visible: true
    width: 400
    height: 640
    FontLoader { id:yekanFontFamily; source: "Yekan.ttf"}

    property var openPagesList: []
    property bool rtl: true

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
                placeholderText: "Search"
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
//            color: "orange"

            ListView {
                id: mainView
                anchors.fill: parent
                property int w: parent.width
                property int h: parent.height / 7

                LayoutMirroring.enabled: mainWindow.rtl
                LayoutMirroring.childrenInherit: true

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
                    leftEyeText: !mainWindow.rtl? leftEyeSph + "  " + leftEyeCyl + " @" + leftEyeAx
                                          : rightEyeSph + "  " + rightEyeCyl + " @" + rightEyeAx
                    rightEyeText: !mainWindow.rtl? rightEyeSph + "  " + rightEyeCyl + " @" + rightEyeAx
                                           : leftEyeSph + "  " + leftEyeCyl + " @" + leftEyeAx
                    lensTypeText: lensType
                    detailText: detail
                }
            }

            Rectangle {
                id: addButton
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                anchors.margins: width / 2.7
                color: "#3498DB"
                width: parent.width * 0.18
                height: width
                radius: width/2
                Image {
                    id: plusImg
                    anchors.centerIn: parent
                    source: "img/plus.png"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: addpage.show()
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
            anchors.left : root.right
            width: parent.width
            height: parent.height
            opacity: 0
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

//        Item{
//            // Temp Item for testing RTL direction.
//            width: parent.width * 0.1
//            height: width
//            anchors.left: parent.left
//            anchors.bottom: parent.bottom
//            MouseArea{
//                anchors.fill: parent
//                onPressAndHold: mainWindow.rtl=!mainWindow.rtl
//            }
//        }

        MessageLine{
            id: messageLine
        }

        focus: true
        Keys.onReleased: {
            if (event.key === Qt.Key_Back)
            {
                print("-->",openPagesList)
                if(openPagesList.length === 0){     // back in the main window
                    if (messageLine.visible)
                        Qt.quit()
                    else
                        messageLine.show(qsTr("Press again to exit"))
                }
                else{
                    openPagesList[openPagesList.length-1].hide()
                }

                event.accepted = true
            }
        }
    }
}
