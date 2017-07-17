import QtQuick 2.7
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1

Item{
    Page {
        anchors.fill: parent

        header: DetailHeader{}

        contentItem: Rectangle{
            color: Universal.theme == Universal.Light ? Universal.background : "#1A1A1A"
            Flickable {
                anchors.fill: parent
                contentWidth: parent.width;
                contentHeight: content.height + 10
                boundsBehavior: Flickable.StopAtBounds
                clip: true
                ColumnLayout{
                    id: content
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 10
                    spacing: 5
                    Item{
                        height: 50
                        width: 50
                        Image {
                            id: graphImg
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            source: "qrc:/img/img/Area Chart-25.png"
                        }
                        ColorOverlay{
                            anchors.fill: graphImg
                            source: graphImg
                            color: Universal.foreground
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked:navigationModel.currentView = navigationModel.getTargetView("Graph", { "runState": toggleButton.state })
                        }
                    }
                    RowLayout{
                        anchors.left: parent.left
                        anchors.right: parent.right
                        spacing: 0
                        Item{
                            Layout.column: 0
                            Layout.fillWidth: true
                        }

                        GridLayout{
                            Layout.column: 1
                            Layout.maximumWidth: 420
                            columnSpacing: 5
                            rowSpacing: 5
                            Text{
                                Layout.column: 1
                                Layout.alignment: Qt.AlignHCenter
                                horizontalAlignment: Text.AlignHCenter
                                text:"0 deg"
                                font.pixelSize: 12
                                font.family: robotoRegular.name
                                color: Universal.foreground
                            }
                            Text{
                                Layout.row: 1
                                Layout.column: 2
                                Layout.alignment: Qt.AlignVCenter
                                text:"90 deg"
                                font.pixelSize: 12
                                font.family: robotoRegular.name
                                color: Universal.foreground
                            }
                            Text{
                                Layout.row: 2
                                Layout.column: 1
                                Layout.alignment: Qt.AlignHCenter
                                horizontalAlignment: Text.AlignHCenter
                                text:"180 deg"
                                font.pixelSize: 12
                                font.family: robotoRegular.name
                                color: Universal.foreground
                            }
                            Text{
                                Layout.row: 1
                                Layout.column: 0
                                Layout.alignment: Qt.AlignVCenter
                                text:"270 deg"
                                font.pixelSize: 12
                                font.family: robotoRegular.name
                                color: Universal.foreground
                            }
                            Text{
                                Layout.row: 1
                                Layout.column: 1
                                Layout.columnSpan: 2
                                Layout.alignment: Qt.AlignRight | Qt.AlignTop
                                text:"Scale: 1NM"
                                color: Universal.foreground
                                font.pixelSize: 12
                                font.family: robotoRegular.name
                                font.weight: Font.DemiBold
                            }
                            Item{
                                id:middle
                                Layout.row: 1
                                Layout.column: 1
                                width: 320
                                height:width
                                Rectangle{
                                    id:firstRec
                                    anchors.centerIn: parent
                                    width: parent.width
                                    height: parent.height
                                    color: "transparent"
                                    radius: width/2
                                    border.width: 1
                                    border.color: Universal.foreground
                                    opacity: 0.6
                                    Rectangle{
                                        id:secondRec
                                        anchors.centerIn: parent
                                        width: firstRec.width * 0.79
                                        height: firstRec.height * 0.79
                                        color: "transparent"
                                        radius: width/2
                                        border.width: 1
                                        border.color: Universal.foreground
                                        Rectangle{
                                            id:thirdRec
                                            anchors.centerIn: parent
                                            width: firstRec.width * 0.58
                                            height: firstRec.height * 0.58
                                            color: "transparent"
                                            radius: width/2
                                            border.width: 1
                                            border.color: Universal.foreground
                                            Rectangle{
                                                id:fourthRec
                                                anchors.centerIn: parent
                                                width: firstRec.width * 0.37
                                                height: firstRec.height * 0.37
                                                color: "transparent"
                                                radius: width/2
                                                border.width: 1
                                                border.color: Universal.foreground
                                                Rectangle{
                                                    anchors.centerIn: parent
                                                    width: firstRec.width * 0.17
                                                    height: firstRec.height * 0.17
                                                    color: "transparent"
                                                    radius: width/2
                                                    border.width: 1
                                                    border.color: Universal.foreground
                                                }
                                            }
                                        }
                                    }
                                }
                                Repeater{
                                    model: objectsList
                                    Rectangle{
                                        id: object
                                        x: parent.width/2 + parent.width/2 * Math.sin(longitude * (Math.PI /180)) - width/2
                                        y: parent.height/2 - (latitude * (2 * parent.height/2)/180) * (Math.cos(longitude * (Math.PI / 180))) - height/2
                                        width: 7
                                        height: 7
                                        color:Universal.foreground
                                        transform: Rotation { origin.x: width/2; origin.y: height/2; angle: 45}
                                        Text {
                                            x: -20
                                            text: modesaddr
                                            font.pixelSize: 10
                                            color: Universal.foreground
                                            transform: Rotation { origin.x: 0; origin.y: 0; angle: -45}
                                        }
                                    }
                                }

                                ListModel{
                                    id: objectsList
                                    ListElement{modesaddr: "2345AA"; latitude: 40.741893768310547; longitude:-73.989311218261719}
                                    ListElement{modesaddr: "CA310A"; latitude:55.755826; longitude:37.6173}
                                    ListElement{modesaddr: "9CDA34"; latitude:-22.906847; longitude:-43.172896}
                                    ListElement{modesaddr: "3BCA14"; latitude:51.507351; longitude:-0.127758}
                                }
                            }
                        }
                        Item{
                            Layout.column: 2
                            Layout.fillWidth: true
                        }
                    }
                }
            }
        }

        footer: Rectangle{
            id:testFooterRect
            height: 110
            anchors.left: parent.left
            anchors.right: parent.right
            color: Universal.theme == Universal.Light ? Universal.background : "#1A1A1A"
            RowLayout{
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 15
                anchors.rightMargin: 15
                anchors.verticalCenter: parent.verticalCenter
                ColumnLayout{
                    Layout.alignment: Qt.AlignBottom
                    Rectangle{
                        Layout.alignment: Qt.AlignHCenter
                        height: 50
                        width: 50
                        radius: 25
                        color: Universal.accent
                        Image {
                            anchors.centerIn: parent
                            source: "qrc:/img/img/previous.png"
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked:navigationModel.currentView = navigationModel.getTargetView("Previous")
                            onPressed: parent.opacity = 0.9
                            onReleased: parent.opacity = 1
                        }
                    }
                    Text {
                        Layout.alignment: Qt.AlignHCenter
                        text: "PREV"
                        font.pixelSize: 12
                        font.weight: Font.Black
                        font.family: robotoRegular.name
                        color: Universal.foreground
                        opacity: 0.6
                    }
                }
                ColumnLayout{
                    Layout.alignment: Qt.AlignBottom
                    Layout.leftMargin: 10
                    Rectangle{
                        Layout.alignment: Qt.AlignHCenter
                        height: 50
                        width: 50
                        radius: 25
                        color: Universal.accent
                        Image {
                            anchors.centerIn: parent
                            source: "qrc:/img/img/next.png"
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked:{
                                navigationModel.setCurrentView(navigationModel.getTargetView("Next"), {
                                                                   "title": navigationModel.navigationParameter.title,
                                                                   "runState": toggleButton.state
                                                               })
                            }
                            onPressed: parent.opacity = 0.9
                            onReleased: parent.opacity = 1
                        }
                    }
                    Text {
                        Layout.alignment: Qt.AlignHCenter
                        text: "NEXT"
                        font.pixelSize: 12
                        font.weight: Font.Black
                        font.family: robotoRegular.name
                        color: Universal.foreground
                        opacity: 0.6
                    }
                }
                Item{
                    Layout.fillWidth: true
                }
                ColumnLayout{
                    Layout.alignment: Qt.AlignBottom
                    Rectangle{
                        Layout.alignment: Qt.AlignHCenter
                        height: 50
                        width: 50
                        radius: 25
                        color: Universal.accent
                        Image {
                            id: setupImage
                            anchors.centerIn: parent
                            source: "qrc:/img/img/Settings-25.png"
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: testSetupPopup.open()
                            onPressed: parent.opacity = 0.9
                            onReleased: parent.opacity = 1
                        }
                    }
                    Text {
                        Layout.alignment: Qt.AlignHCenter
                        text: "SETUP"
                        font.pixelSize: 12
                        font.weight: Font.Black
                        font.family: robotoRegular.name
                        color: Universal.foreground
                        opacity: 0.6
                    }
                }
                ColumnLayout{
                    Layout.alignment: Qt.AlignBottom
                    Layout.leftMargin: 10
                    Rectangle{
                        id: toggleButton
                        Layout.alignment: Qt.AlignHCenter
                        height: 70
                        width: 70
                        radius: 35
                        color: Universal.accent
                        property alias imageSource: buttonImage.source
                        state: navigationModel.navigationParameter.runState
                        Image {
                            id: buttonImage
                            anchors.centerIn: parent
                            smooth: true
                        }
                        MouseArea {
                            id: mouseArea
                            anchors.fill: parent
                            onPressed: {
                                parent.opacity = 0.9
                                if (parent.state == "start") {
                                    parent.state = "pause"
                                }
                                else if(parent.state == "pause"){
                                    parent.state = "stop"
                                }
                                else{
                                    parent.state = "start"
                                }
                            }
                            onReleased: parent.opacity = 1
                        }
                        states: [
                            State {
                                name: "start"
                                PropertyChanges {
                                    target: toggleButton
                                    imageSource: "qrc:/img/img/play-button.png"
                                }
                            },
                            State {
                                name: "stop"
                                PropertyChanges {
                                    target: toggleButton
                                    imageSource: "qrc:/img/img/stop-button.png"
                                }
                            },
                            State {
                                name: "pause"
                                PropertyChanges {
                                    target: toggleButton
                                    imageSource: "qrc:/img/img/pause-button.png"
                                }
                            }
                        ]
                    }
                    Text {
                        Layout.alignment: Qt.AlignHCenter
                        text: toggleButton.state
                        font.pixelSize: 12
                        font.capitalization: Font.AllUppercase
                        font.weight: Font.Black
                        font.family: robotoRegular.name
                        color: Universal.foreground
                        opacity: 0.6
                    }
                }
            }
        }
    }
    Popup {
        id: detailMenuPopup
        height: parent.height
        width: parent.width
        modal: true
        closePolicy: Popup.CloseOnEscape
        padding: 30
        background: Rectangle{
            color: Universal.theme == Universal.Light ? "#99000000" : "#cc666666"
        }
        contentItem: DetailMenu{}
    }
    Popup {
        id: testSetupPopup
        height: parent.height
        width: parent.width
        modal: true
        closePolicy: Popup.CloseOnEscape
        background: Rectangle{
            color: Universal.theme == Universal.Light ? "#99000000" : "#cc666666"
        }
        contentItem: TestSetup{}
    }
}

