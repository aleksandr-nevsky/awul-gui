//import QtQuick 2.15
//import QtQuick.Window 2.15
//import QtQuick.Controls 2.12
//import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.15
import QtQuick 2.5
import QtQuick.Controls 1.4


Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Awesome wake-up light")

    MainWindow {
        // Растягиваем объект главного окна по всему родительскому элементу
        anchors.fill: parent
    }
}
