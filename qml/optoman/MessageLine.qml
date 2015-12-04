import QtQuick 2.1

Rectangle{
    id: root
    color: "black"
    opacity: 0.9
    height: parent.height * 0.07
    width: Math.min(message.implicitWidth+parent.width *0.1, parent.width *0.9)
    anchors.bottom: parent.bottom
    anchors.bottomMargin: parent.height * 0.1
    anchors.horizontalCenter: parent.horizontalCenter
    clip: true
    visible: message.text !== ""

    function show(msg){
        message.text = msg
        timer.running = true
    }

    Text {
        id: message
        anchors.centerIn: parent
        color: "white"
    }
    Timer {
        id: timer
        interval: 3000;
        onTriggered: message.text=""
    }
}
