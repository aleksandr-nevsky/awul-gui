import QtQuick 2.4

MainWindowForm {

    anchors.fill: parent

    Component.onCompleted: {
        init();
    }

    function init() {
        writeLog("MainWindow Component.onCompleted");

        var requestWakeupToggle = new XMLHttpRequest();
        var requestGetValue = new XMLHttpRequest();
        requestGetValue.open('GET', 'http://awul-host.lu.nevsky.cc:8080/awul/pwm/getValue');
        requestGetValue.onreadystatechange = function handleGetValueRequest() {

            if (requestGetValue.readyState === XMLHttpRequest.DONE) {
                if (requestGetValue.status === 200) {
                    writeLog("getValue value = " + requestGetValue.responseText);
                    sliderPwm.value = requestGetValue.responseText;
                } else {
                    //                    console.log("getValue request failed", requestGetValue.status)
                    writeLog("getValue request failed " + requestGetValue.status)
                }
            }
        }
        requestGetValue.send();


        requestWakeupToggle.open('GET', 'http://awul-host.lu.nevsky.cc:8080/awul/wakeupToggle');
        requestWakeupToggle.onreadystatechange = function handleGetWakeupToggle() {

            if (requestWakeupToggle.readyState === XMLHttpRequest.DONE) {
                if (requestWakeupToggle.status === 200) {
                    writeLog("wakeupToggle value = " + requestWakeupToggle.responseText);
                    if(requestWakeupToggle.responseText === "true") {
                        switchWakeupToggle.checked = true;
                    } else {
                        switchWakeupToggle.checked = false;
                    }

                } else {
                    //                    console.log("wakeupToggle request failed", requestWakeupToggle.status)
                    writeLog("wakeupToggle request failed " + requestGetValue.status)
                }
            }
        }
        requestWakeupToggle.send();

        writeLog("MainWindow Component.onCompleted END");

    }

    sliderPwm.onValueChanged: {
        var request = new XMLHttpRequest();
        request.open('GET', 'http://awul-host.lu.nevsky.cc:8080/awul/pwm/' + sliderPwm.value);
        request.onreadystatechange = function handleGetValueRequest() {
            if (request.readyState === XMLHttpRequest.DONE) {
                writeLog("sliderPwm.onValueChanged " + request.status)
            }
        }
        request.send();
    }

    switchWakeupToggle.onClicked: {
        var request = new XMLHttpRequest();
        request.open('GET', 'http://awul-host.lu.nevsky.cc:8080/awul/wakeupToggle/' + switchWakeupToggle.checked);
        request.onreadystatechange = function handleGetValueRequest() {
            if (request.readyState === XMLHttpRequest.DONE) {
                writeLog("switchWakeupToggle.onClicked " + request.status)
            }
        }
        request.send();
    }

    buttonOff.onClicked: {
        var request = new XMLHttpRequest();
        request.open('GET', 'http://awul-host.lu.nevsky.cc:8080/awul/lightOff');
        request.onreadystatechange = function handleGetValueRequest() {
            if (request.readyState === XMLHttpRequest.DONE) {
                writeLog("buttonOff.onClicked " + request.status)
            }
        }
        request.send();
        sliderPwm.value = 0;
    }

    function writeLog(message) {
        console.log(message);
        logArea.append(message);
    }

}
