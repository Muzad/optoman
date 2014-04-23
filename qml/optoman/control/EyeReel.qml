import QtQuick 2.1

Item {
    id: container

    property int w: (width-2*spacing)*0.27
    property int h: height

    property int atIconWidth: width / 7
    property int atIconHeight: width / 7
    // Font properties
    property string fontName: 'Helvetica'
    property int fontSize: 15
    property color fontColor: "#666666"
    // Spacing between items
    property int spacing: width / 35

    property Component itemBackground: Component {
        BorderImage {
            border { top: 8; bottom: 8; left: 8; right: 8 }
            source: "gfx/button.png"
        }
    }
    property Component itemBackgroundPressed: Component {
        BorderImage {
            border { top: 8; bottom: 8; left: 8; right: 8 }
            source: "gfx/button_pressed.png"
        }
    }

    width: 380
    height:  60

    Component.onCompleted: {
        sphReel.index = sphModel.start
        cylReel.index = cylModel.start
        axReel.index = axModel.start
    }

    Component {
        id: sphDelegate
        Button {
            width: container.w
            height: container.h
            text: number
            fontColor: container.fontColor
            fontName: container.fontName
            fontSize: container.fontSize
            bg: itemBackground
            bgPressed: itemBackgroundPressed
            onClicked: { sphReel.index = index; sphReel.toggle() }
        }
    }

    Component {
        id: cylDelegate
        Button {
            width: container.w
            height: container.h
            text: number
            fontColor: container.fontColor
            fontName: container.fontName
            fontSize: container.fontSize
            bg: itemBackground
            bgPressed: itemBackgroundPressed
            onClicked: { cylReel.index = index; cylReel.toggle() }
        }
    }

    Component {
        id: axDelegate
        Button {
            width: container.w
            height: container.h
            text: number
            fontColor: container.fontColor
            fontName: container.fontName
            fontSize: container.fontSize
            bg: itemBackground
            bgPressed: itemBackgroundPressed
            onClicked: { axReel.index = index; axReel.toggle() }
        }
    }
    Row {
        id: reels
        spacing: container.spacing
        anchors.fill: parent

        Reel {
            id: sphReel
            width: container.w
            height: container.h
            model: sphModel
            delegate: sphDelegate
            autoClose: true
        }

        Reel {
            id: cylReel
            width: container.w
            height: container.h
            model: cylModel
            delegate: cylDelegate
            autoClose: true

        }

        Image {
            id:atIcon
            width: container.atIconWidth
            height: container.atIconHeight
            smooth: true
            source: "gfx/atIcon.png"
            fillMode: Image.PreserveAspectFit
            anchors.verticalCenter: parent.verticalCenter
        }

        Reel {
            id: axReel
            width: container.w
            height: container.h
            model: axModel
            delegate:  axDelegate
            autoClose: true
        }
    }


    ListModel{
        id: sphModel
        property int start: 32

        ListElement { number: " 8" }
        ListElement { number: " 7.75" }
        ListElement { number: " 7.5" }
        ListElement { number: " 7.25" }
        ListElement { number: " 7" }
        ListElement { number: " 6.75" }
        ListElement { number: " 6.5" }
        ListElement { number: " 6.25" }
        ListElement { number: " 6" }
        ListElement { number: " 5.75" }
        ListElement { number: " 5.5" }
        ListElement { number: " 5.25" }
        ListElement { number: " 5" }
        ListElement { number: " 4.75" }
        ListElement { number: " 4.5" }
        ListElement { number: " 4.25" }
        ListElement { number: " 4" }
        ListElement { number: " 3.75" }
        ListElement { number: " 3.5" }
        ListElement { number: " 3.25" }
        ListElement { number: " 3" }
        ListElement { number: " 2.75" }
        ListElement { number: " 2.5" }
        ListElement { number: " 2.25" }
        ListElement { number: " 2" }
        ListElement { number: " 1.75" }
        ListElement { number: " 1.5" }
        ListElement { number: " 1.25" }
        ListElement { number: " 1" }
        ListElement { number: " 0.75" }
        ListElement { number: " 0.5" }
        ListElement { number: " 0.25" }
        ListElement { number: " 0" }
        ListElement { number: "-0.25" }
        ListElement { number: "-0.5" }
        ListElement { number: "-0.75" }
        ListElement { number: "-1" }
        ListElement { number: "-1.25" }
        ListElement { number: "-1.5" }
        ListElement { number: "-1.75" }
        ListElement { number: "-2" }
        ListElement { number: "-2.25" }
        ListElement { number: "-2.5" }
        ListElement { number: "-2.75" }
        ListElement { number: "-3" }
        ListElement { number: "-3.25" }
        ListElement { number: "-3.5" }
        ListElement { number: "-3.75" }
        ListElement { number: "-4" }
        ListElement { number: "-4.25" }
        ListElement { number: "-4.5" }
        ListElement { number: "-4.75" }
        ListElement { number: "-5" }
        ListElement { number: "-5.25" }
        ListElement { number: "-5.5" }
        ListElement { number: "-5.75" }
        ListElement { number: "-6" }
        ListElement { number: "-6.25" }
        ListElement { number: "-6.5" }
        ListElement { number: "-6.75" }
        ListElement { number: "-7" }
        ListElement { number: "-7.25" }
        ListElement { number: "-7.5" }
        ListElement { number: "-7.75" }
        ListElement { number: "-8" }
        ListElement { number: "-8.25" }
        ListElement { number: "-8.5" }
        ListElement { number: "-8.75" }
        ListElement { number: "-9" }
        ListElement { number: "-9.25" }
        ListElement { number: "-9.5" }
        ListElement { number: "-9.75" }
        ListElement { number: "-10" }
        ListElement { number: "-10.25" }
        ListElement { number: "-10.5" }
        ListElement { number: "-10.75" }
        ListElement { number: "-11" }
    }

    ListModel{
        id: cylModel
        property int start: 5
        ListElement { number: "2.75";  }
        ListElement { number: "2.25";  }
        ListElement { number: "1.75";  }
        ListElement { number: "1.25";  }
        ListElement { number: "0.75";  }
        ListElement { number: "0";  }

    }

    ListModel {
        id: axModel
        property int start: 180

        ListElement { number: "180"}
        ListElement { number: "179"}
        ListElement { number: "178"}
        ListElement { number: "177"}
        ListElement { number: "176"}
        ListElement { number: "175"}
        ListElement { number: "174"}
        ListElement { number: "173"}
        ListElement { number: "172"}
        ListElement { number: "171"}
        ListElement { number: "170"}
        ListElement { number: "169"}
        ListElement { number: "168"}
        ListElement { number: "167"}
        ListElement { number: "166"}
        ListElement { number: "165"}
        ListElement { number: "164"}
        ListElement { number: "163"}
        ListElement { number: "162"}
        ListElement { number: "161"}
        ListElement { number: "160"}
        ListElement { number: "159"}
        ListElement { number: "158"}
        ListElement { number: "157"}
        ListElement { number: "156"}
        ListElement { number: "155"}
        ListElement { number: "154"}
        ListElement { number: "153"}
        ListElement { number: "152"}
        ListElement { number: "151"}
        ListElement { number: "150"}
        ListElement { number: "149"}
        ListElement { number: "148"}
        ListElement { number: "147"}
        ListElement { number: "146"}
        ListElement { number: "145"}
        ListElement { number: "144"}
        ListElement { number: "143"}
        ListElement { number: "142"}
        ListElement { number: "141"}
        ListElement { number: "140"}
        ListElement { number: "139"}
        ListElement { number: "138"}
        ListElement { number: "137"}
        ListElement { number: "136"}
        ListElement { number: "135"}
        ListElement { number: "134"}
        ListElement { number: "133"}
        ListElement { number: "132"}
        ListElement { number: "131"}
        ListElement { number: "130"}
        ListElement { number: "129"}
        ListElement { number: "128"}
        ListElement { number: "127"}
        ListElement { number: "126"}
        ListElement { number: "125"}
        ListElement { number: "124"}
        ListElement { number: "123"}
        ListElement { number: "122"}
        ListElement { number: "121"}
        ListElement { number: "120"}
        ListElement { number: "119"}
        ListElement { number: "118"}
        ListElement { number: "117"}
        ListElement { number: "116"}
        ListElement { number: "115"}
        ListElement { number: "114"}
        ListElement { number: "113"}
        ListElement { number: "112"}
        ListElement { number: "111"}
        ListElement { number: "110"}
        ListElement { number: "109"}
        ListElement { number: "108"}
        ListElement { number: "107"}
        ListElement { number: "106"}
        ListElement { number: "105"}
        ListElement { number: "104"}
        ListElement { number: "103"}
        ListElement { number: "102"}
        ListElement { number: "101"}
        ListElement { number: "100"}
        ListElement { number: "99"}
        ListElement { number: "98"}
        ListElement { number: "97"}
        ListElement { number: "96"}
        ListElement { number: "95"}
        ListElement { number: "94"}
        ListElement { number: "93"}
        ListElement { number: "92"}
        ListElement { number: "91"}
        ListElement { number: "90"}
        ListElement { number: "89"}
        ListElement { number: "88"}
        ListElement { number: "87"}
        ListElement { number: "86"}
        ListElement { number: "85"}
        ListElement { number: "84"}
        ListElement { number: "83"}
        ListElement { number: "82"}
        ListElement { number: "81"}
        ListElement { number: "80"}
        ListElement { number: "79"}
        ListElement { number: "78"}
        ListElement { number: "77"}
        ListElement { number: "76"}
        ListElement { number: "75"}
        ListElement { number: "74"}
        ListElement { number: "73"}
        ListElement { number: "72"}
        ListElement { number: "71"}
        ListElement { number: "70"}
        ListElement { number: "69"}
        ListElement { number: "68"}
        ListElement { number: "67"}
        ListElement { number: "66"}
        ListElement { number: "65"}
        ListElement { number: "64"}
        ListElement { number: "63"}
        ListElement { number: "62"}
        ListElement { number: "61"}
        ListElement { number: "60"}
        ListElement { number: "59"}
        ListElement { number: "58"}
        ListElement { number: "57"}
        ListElement { number: "56"}
        ListElement { number: "55"}
        ListElement { number: "54"}
        ListElement { number: "53"}
        ListElement { number: "52"}
        ListElement { number: "51"}
        ListElement { number: "50"}
        ListElement { number: "49"}
        ListElement { number: "48"}
        ListElement { number: "47"}
        ListElement { number: "46"}
        ListElement { number: "45"}
        ListElement { number: "44"}
        ListElement { number: "43"}
        ListElement { number: "42"}
        ListElement { number: "41"}
        ListElement { number: "40"}
        ListElement { number: "39"}
        ListElement { number: "38"}
        ListElement { number: "37"}
        ListElement { number: "36"}
        ListElement { number: "35"}
        ListElement { number: "34"}
        ListElement { number: "33"}
        ListElement { number: "32"}
        ListElement { number: "31"}
        ListElement { number: "30"}
        ListElement { number: "29"}
        ListElement { number: "28"}
        ListElement { number: "27"}
        ListElement { number: "26"}
        ListElement { number: "25"}
        ListElement { number: "24"}
        ListElement { number: "23"}
        ListElement { number: "22"}
        ListElement { number: "21"}
        ListElement { number: "20"}
        ListElement { number: "19"}
        ListElement { number: "18"}
        ListElement { number: "17"}
        ListElement { number: "16"}
        ListElement { number: "15"}
        ListElement { number: "14"}
        ListElement { number: "13"}
        ListElement { number: "12"}
        ListElement { number: "11"}
        ListElement { number: "10"}
        ListElement { number: "9"}
        ListElement { number: "8"}
        ListElement { number: "7"}
        ListElement { number: "6"}
        ListElement { number: "5"}
        ListElement { number: "4"}
        ListElement { number: "3"}
        ListElement { number: "2"}
        ListElement { number: "1"}
        ListElement { number: "0"}

    }
}
