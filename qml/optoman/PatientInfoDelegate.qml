import QtQuick 2.1

Item{
    id: root
    property string nameText: ""
    property string phoneText: ""
    property string leftEyeText: ""
    property string rightEyeText: ""
    property string lensTypeText: ""
    property alias detailText: detailPlaceText.text
    property string dayValue: ""
    property string monthValue: ""
    property string yearValue: ""

    property var fontFamily: mainWindow.rtl? yekanFontFamily.name :"Arial"
    property int fontSize: width * 0.04
    property int rowHeight: ListView.view.h / 2

    MouseArea{
        id: itemMouseArea
        anchors.fill: parent
        onPressAndHold: confirmationDialog.show(ID)
        onClicked: {
            root.state = (root.state === "EXPAND")? "" :"EXPAND"
        }
    }

    Item {
        id: patientPersonalInfoPlace
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
        }
        height: rowHeight

        Text {
            id: namePlaceText
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.05
            anchors.bottom: parent.bottom
            width: parent.width * 0.35
            horizontalAlignment: mainWindow.rtl? Text.AlignLeft :Text.AlignRight
            font.pixelSize: fontSize * 1.2
            font.bold: true
            font.family: root.fontFamily
            text: nameText
            clip: true
        }

        Text{
            id: phonePlace
            font.family: root.fontFamily
            text: phoneText!==""? "(" + phoneText + ")" :""
            anchors.left: namePlaceText.right
            anchors.leftMargin: parent.width * 0.04
            anchors.bottom: parent.bottom
            font.italic: true
        }

        Text {
            id: datePlaceText
            anchors.right: parent.right
            anchors.rightMargin: parent.width * 0.05
            text: (yearValue !== helper.currentJalaliYear())?
                      yearValue.substring(2) + "/" + monthValue + "/" + dayValue
                    : monthValue + "/" + dayValue
            anchors.bottom: parent.bottom
            font.pixelSize: fontSize
            color: "gray"
        }
    }

    Item{
        id: eyeInfoPlace
        anchors {
            left: parent.left
            right: parent.right
            top: patientPersonalInfoPlace.bottom
        }
        height: rowHeight

        Image {
            id: arrowImage
            source: "img/arrow.png"
            height: parent.height * 0.4
            fillMode: Image.PreserveAspectFit
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: namePlaceText.anchors.leftMargin * 1.2
            mirror: LayoutMirroring.enabled? true :false
        }
        Text {
            id: leftEyePlaceText
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: arrowImage.right
            anchors.leftMargin: namePlaceText.anchors.leftMargin * 0.5
            font.pixelSize: fontSize
            text: leftEyeText
        }
        Text {
            id: rightEyePlaceText
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: leftEyePlaceText.right
            anchors.leftMargin: namePlaceText.anchors.leftMargin
            font.pixelSize: fontSize
            text: rightEyeText
        }
    }

    Rectangle{
        id: itemsSeparator
        width: parent.width
        height: 1
        color: "gray"
        anchors.top: root.bottom
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
            text: /*lensTypeText === ""? "" :"Lens Type: " + */lensTypeText
            font.italic: true
            font.family: root.fontFamily
            anchors.left: parent.left
            anchors.leftMargin: namePlaceText.anchors.leftMargin
        }
    }

    Item {
        id: detailPlace
        opacity: 0
        anchors {
            left: parent.left
            right: parent.right
            top: typePlace.bottom
            leftMargin: namePlaceText.anchors.leftMargin
            rightMargin: anchors.leftMargin
        }
        height: detailPlaceText.text===""? anchors.leftMargin/2 :detailPlaceText.implicitHeight + anchors.leftMargin/2
        Text {
            id: detailPlaceText
            wrapMode: Text.WordWrap
            anchors.left: parent.left
            anchors.right: parent.right
            font.italic: true
            font.family: root.fontFamily
            horizontalAlignment: Text.AlignJustify
        }
    }

    Rectangle{              //Dim layer
        color: "black"
        opacity: 0.1
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
