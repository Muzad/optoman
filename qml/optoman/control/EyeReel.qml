import QtQuick 2.1
import QtQuick.Extras 1.4
//import QtQuick.Controls.Styles 1.4

Item{
    id: eyeReel

    function sphValue()
    {
        return sphModel.get(tumbler.currentIndexAt(0)).number
    }

    function cylValue()
    {
        return cylModel.get(tumbler.currentIndexAt(1)).number
    }

    function axValue()
    {
        return axModel.get(tumbler.currentIndexAt(2)).number
    }

    function reset()
    {
        tumbler.setCurrentIndexAt(0,sphModel.start)
        tumbler.setCurrentIndexAt(1,cylModel.start)
        tumbler.setCurrentIndexAt(2,axModel.start)
    }

    Row {
        id:titles
        height: 25
        anchors.left: parent.left
        anchors.leftMargin: 10
        spacing: 10
        Text {
            width: c1.width
            text: "SPH"
            color: "#666666"
        }
        Text {
            width: c2.width
            text: "CYL"
            color: "#666666"
        }
        Text {
            width: c3.width
            text: "@AX"
            color: "#666666"
        }
    }
    Rectangle{
        id:tumblerBox
        color: "transparent"
        anchors.left: parent.left
        anchors.top: titles.bottom
        width: parent.width - 5
        height: parent.height - titles.height
        Tumbler {
            id: tumbler
            height: parent.height
            TumblerColumn {
                id:c1
                width: tumblerBox.width / 3 - 10
                model: sphModel
            }
            TumblerColumn {
                id:c2
                width: c1.width
                model: cylModel
            }
            TumblerColumn {
                id:c3
                width: c1.width
                model: axModel
            }
            //            style: myTumblerStyle

            Component.onCompleted: reset()
        }
    }

//    Component{
//        id: myTumblerStyle
//        TumblerStyle{

//            delegate: Text {
//                id: test
//                horizontalAlignment: Text.AlignHCenter
//                text: styleData.value
//                height: green.height/3
//                color: (styleData.current)?"black": "gray"
//                MouseArea{
//                    anchors.fill: parent
//                    onClicked: {
//                        tumbler2.setCurrentIndexAt(1, styleData.index)
//                        print(styleData.index)
//                    }
//                }
//            }
//            separator: Rectangle{
//                color: "blue"
//                width: 10
//                height: 50
//            }
//            background: Rectangle{
//                color: "blue"
//                border.color: "pink"
//                width: eyeReel/3
//                height: 100
//            }
//            highlight: Rectangle{
//                color: "transparent"
//                height: 40
//            }
//        }
//    }

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
