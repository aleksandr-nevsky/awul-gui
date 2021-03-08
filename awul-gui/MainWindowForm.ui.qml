import QtQuick 2.4
import QtQuick.Controls 2.15

Item {
    width: 400
    height: 400
    property alias buttonOff: buttonOff
    property alias switchWakeupToggle: switchWakeupToggle
    property alias sliderPwm: sliderPwm

    Slider {
        id: sliderPwm
        x: 8
        y: 8
        width: 384
        height: 48
        stepSize: 5
        to: 100
        value: 0
    }

    Switch {
        id: switchWakeupToggle
        x: 146
        y: 62
        text: qsTr("Switch")
    }

    Button {
        id: buttonOff
        x: 146
        y: 104
        text: qsTr("Off")
    }
}
