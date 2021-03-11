import QtQuick 2.4
import QtQuick.Controls 2.15

Item {
    id: item1
    width: 400
    height: 400
    property alias buttonOff: buttonOff
    property alias switchWakeupToggle: switchWakeupToggle
    property alias sliderPwm: sliderPwm

    Row {
        id: row
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: 0

        Slider {
            id: sliderPwm
            width: 259
            height: 48
            anchors.top: parent.top
            anchors.topMargin: 40
            anchors.horizontalCenter: parent.horizontalCenter
            stepSize: 5
            to: 100
            value: 0
        }

        Button {
            id: buttonOff
            width: 80
            height: 40
            text: qsTr("Off")
            anchors.top: switchWakeupToggle.bottom
            anchors.topMargin: 40
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Switch {
            id: switchWakeupToggle
            text: qsTr("Будильник")
            anchors.top: sliderPwm.bottom
            anchors.topMargin: 40
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
