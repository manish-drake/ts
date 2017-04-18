import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

Item{
    Rectangle{
        id: header
        anchors.left: parent.left
        anchors.right: parent.right
        height:40
        color:"transparent"
        Text {
            anchors.centerIn: parent
            text: qsTr("USERS")
            elide:Text.ElideRight
            font.pixelSize: 14
            font.weight: Font.DemiBold
            clip:true
        }
        Rectangle{
            id: rectangle
            width: 40
            height: parent.height
            anchors.right: parent.right
            color:"transparent"
            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/img/img/Delete-25.png"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    onClicked:navigationModel.currentView = navigationModel.getTargetView("back")
                }
            }
        }
    }

    Rectangle{
        anchors.top: header.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        clip: true
        color: "transparent"
        GridView{
            id: userGridView
            anchors.fill: parent
            anchors.topMargin: 10
            anchors.leftMargin: 10
            anchors.bottomMargin: 50
            cellWidth: userGridView.width/2; cellHeight: 200
            model: usersModel
            delegate: userCardDelegate
            currentIndex: -1
            focus: true
            highlight:Rectangle{
                color: "transparent"
                border.color: "#377DF3"
                border.width: 1
                radius:5
            }
            Component{
                id: userCardDelegate
                Rectangle {
                    id: wrapper
                    width: userGridView.cellWidth - 10
                    height: userGridView.cellHeight -10
                    border.color: "#0d000000"
                    border.width: 1
                    radius: 5
                    layer.enabled: true
                    layer.effect: DropShadow {
                        transparentBorder: true
                        horizontalOffset: 1.1
                        verticalOffset: 1.1
                        radius: 4.0
                        color: "#0d000000"
                        spread: 0
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            navigationModel.setCurrentView(navigationModel.getTargetView("UserDetail"), {
                                                               "user": usersModel.get(index),

                                                           })
                        }
                    }

                    Text {
                        anchors.centerIn: parent
                        text: qsTr(userName)
                        elide:Text.ElideRight
                        font.pointSize: 12
                        font.weight: Font.DemiBold
                        clip:true
                    }
                    Row {
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.margins: 10
                        Text {
                            font.pointSize: 10
                            text: qsTr("LANGUAGE: ")
                        }
                        Text {
                            font.pointSize: 10
                            text: qsTr(language)
                        }

                    }
                }
            }
            ListModel {//as per discussion only top four values will be displayed here
                id:usersModel
                ListElement {
                    userID: "Default"
                    userName: "OPERATOR"
                    language: "English"
                    emailID: "operator@mail.com"
                    isRemovable: false
                }
                ListElement {
                    userID: "ken"
                    userName: "KEN FILARDO"
                    language: "English"
                    emailID: "ken@mail.com"
                    isRemovable: true
                }
                ListElement {
                    userID: "dave"
                    userName: "DAVE KLAMET"
                    language: "English"
                    emailID: "dave@mail.com"
                    isRemovable: true
                }
                ListElement {
                    userID: "steve"
                    userName: "STEVE O'HARA"
                    language: "English"
                    emailID: "steve@mail.com"
                    isRemovable: true
                }
            }
        }
    }

    Rectangle{
        id: addUserButton
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 20
        height: 40
        width: 40
        radius: width*0.5
        color: "#377DF3"
        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            horizontalOffset: 1.1
            verticalOffset: 1.1
            radius: 4.0
            color: "#80000000"
            spread: 0
        }
        Text{
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 1
            anchors.leftMargin: 10
            text:"+"
            font.pixelSize: 28
            font.weight: Font.bold
            color:"white"
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                //usersModel.insert(0,{ "userID": "st", "userName": "ST", "language": "En","emailID": "st","isRemovable": true})
                navigationModel.currentView = navigationModel.getTargetView("AddUser")
            }

        }
    }

    Rectangle{
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 80
        height: 40
        width: 40
        radius: width*0.5
        color: "red"
        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            horizontalOffset: 1.1
            verticalOffset: 1.1
            radius: 4.0
            color: "#80000000"
            spread: 0
        }
        Text{
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 1
            anchors.leftMargin: 10
            text:""
            font.pixelSize: 28
            font.weight: Font.bold
            color:"white"
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {usersModel.remove(0,1)}

        }
    }

}


