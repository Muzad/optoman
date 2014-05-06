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

    property string sphValue
    property string cylValue
    property string axValue


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

    function clear()
    {
        sphReel.index = sphModel.start
        cylReel.index = cylModel.start
        axReel.index = axModel.start
    }

    Component {
        id: sphDelegate
        Button {
            id:sphb
            width: container.w
            height: container.h
            text: number
            fontColor: container.fontColor
            fontName: container.fontName
            fontSize: container.fontSize
            bg: itemBackground
            bgPressed: itemBackgroundPressed
            onClicked: { sphReel.index = index; sphReel.toggle(); console.log(sphb.text)}//container.sphValue = text }
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
            onClicked: { cylReel.index = index; cylReel.toggle(); container.cylValue = text }
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
            onClicked: { axReel.index = index; axReel.toggle(); container.axValue = number }
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
            onIndexChanged: {
                container.sphValue = sphModel.get(index).number
            }
        }

        Reel {
            id: cylReel
            width: container.w
            height: container.h
            model: cylModel
            delegate: cylDelegate
            autoClose: true
            onIndexChanged: {
                container.cylValue = cylModel.get(index).number
            }

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
            onIndexChanged: {
                container.axValue = axModel.get(index).number
            }
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
        property int start: 0
        ListElement { number: " 0";  }
        ListElement { number: "-0.75";  }
        ListElement { number: "-1.25";  }
        ListElement { number: "-1.75";  }
        ListElement { number: "-2.25";  }
        ListElement { number: "-2.75";  }
    }

    ListModel {
        id: axModel
        property int start: 36

        ListElement { number: "180"}
        ListElement { number: "175"}
        ListElement { number: "170"}
        ListElement { number: "165"}
        ListElement { number: "160"}
        ListElement { number: "155"}
        ListElement { number: "150"}
        ListElement { number: "145"}
        ListElement { number: "140"}
        ListElement { number: "135"}
        ListElement { number: "130"}
        ListElement { number: "125"}
        ListElement { number: "120"}
        ListElement { number: "115"}
        ListElement { number: "110"}
        ListElement { number: "105"}
        ListElement { number: "100"}
        ListElement { number: "95"}
        ListElement { number: "90"}
        ListElement { number: "85"}
        ListElement { number: "80"}
        ListElement { number: "75"}
        ListElement { number: "70"}
        ListElement { number: "65"}
        ListElement { number: "60"}
        ListElement { number: "55"}
        ListElement { number: "50"}
        ListElement { number: "45"}
        ListElement { number: "40"}
        ListElement { number: "35"}
        ListElement { number: "30"}
        ListElement { number: "25"}
        ListElement { number: "20"}
        ListElement { number: "15"}
        ListElement { number: "10"}
        ListElement { number: "5"}
        ListElement { number: "0"}

    }
}
