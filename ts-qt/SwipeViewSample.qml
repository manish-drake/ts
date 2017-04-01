import QtQuick 2.0
import QtQuick.Controls 2.1


Rectangle{
    anchors.fill:parent
    SwipeView {
        id: view

        currentIndex: 1
        anchors.fill: parent

        Item {
            id: firstPage
            Rectangle{
                color: "red"
               anchors.fill:parent
                Card{}
            }

        }
        Item {
            id: secondPage
            Rectangle{
                anchors.fill:parent
                color: "green"
                Cards{}
            }
        }
        Item {
            id: thirdPage
            Rectangle{
                anchors.fill:parent
                color: "blue"
               SetupDisplay{}

            }
        }
        Item {
            id: thirdPage1
            Rectangle{
                anchors.fill:parent
                color: "blue"
                Aircrafts{}

            }
        }
        Item {
            id: thirdPage2
            Rectangle{
                anchors.fill:parent
                color: "blue"
                NetworkInfo{}

            }
        }


    }

    PageIndicator {
        id: indicator

        count: view.count
        currentIndex: view.currentIndex

        anchors.bottom: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
