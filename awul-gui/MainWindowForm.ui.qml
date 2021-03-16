import QtQuick 2.4
import QtQuick.Controls 2.15

Item {
    id: item1
    width: 400
    height: 400
    property alias image1Width: image1.width
    property alias imageHeight: image.height
    property alias buttonOff: buttonOff
    property alias switchWakeupToggle: switchWakeupToggle
    property alias sliderPwm: sliderPwm

    GridView {
        id: gridView
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: 0

        Slider {
            id: sliderPwm
            width: 250
            height: 50
            anchors.left: imageLight.right
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.leftMargin: 20
            stepSize: 5
            to: 100
            value: 0
        }

        Button {
            id: buttonOff
            width: 100
            height: 50
            text: qsTr("Off")
//            icon.source: "qrc:/icons/outline_power_off_black_18.png"
            anchors.top: switchWakeupToggle.bottom
            display: AbstractButton.IconOnly
            anchors.topMargin: 40
            anchors.horizontalCenter: parent.horizontalCenter

            Image {
                id: image
                width: parent.width
                height: parent.height
                source: "icons/outline_power_off_black_18.png"
                fillMode: Image.PreserveAspectFit
            }
        }

        Switch {
            id: switchWakeupToggle
            width: 100
            height: 50
            anchors.top: sliderPwm.bottom
            anchors.horizontalCenterOffset: -40
            anchors.topMargin: 40
            anchors.horizontalCenter: parent.horizontalCenter

            Image {
                id: image1
                width: parent.width
                height: parent.height
                anchors.left: parent.left
                source: "icons/outline_alarm_on_black_18.png"
                anchors.leftMargin: 80
                fillMode: Image.PreserveAspectFit
            }
        }

        Image {
            id: imageLight
            width: 50
            height: 50
            anchors.verticalCenter: sliderPwm.verticalCenter
            anchors.left: parent.left
            source: "icons/outline_light_mode_black_18.png"
            anchors.leftMargin: 20
            fillMode: Image.PreserveAspectFit
        }
    }
}
