import QtQuick
import EvHmi

Item {
    id: root

    property int currentPageIndex: 0
    readonly property var pages: [
        { "label": "Home" },
        { "label": "Music" },
        { "label": "Set" },
        { "label": "Dbg" }
    ]

    Rectangle {
        anchors.fill: parent
        color: Colors.backgroundPrimary

        Rectangle {
            anchors.fill: parent
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#090B0D" }
                GradientStop { position: 0.58; color: Colors.backgroundPrimary }
                GradientStop { position: 1.0; color: "#060707" }
            }
        }
    }

    Item {
        id: topBar
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: Theme.topBarHeight

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            text: "EV HMI"
            color: Colors.textSecondary
            font.family: Typography.family
            font.pixelSize: Typography.bodyMedium
            font.weight: Font.DemiBold
        }

        Rectangle {
            anchors.left: parent.left
            anchors.leftMargin: Theme.pageMargin
            anchors.verticalCenter: parent.verticalCenter
            width: Math.round(52 * Theme.scale)
            height: Math.round(34 * Theme.scale)
            radius: Math.round(5 * Theme.scale)
            color: Colors.surfaceBase
            border.color: Colors.borderSubtle
            border.width: 1

            Text {
                anchors.centerIn: parent
                text: "DBG"
                color: Colors.textMuted
                font.family: Typography.family
                font.pixelSize: Typography.label
                font.weight: Font.Medium
            }

            MouseArea {
                anchors.fill: parent
                onClicked: root.currentPageIndex = 3
            }
        }

        Row {
            anchors.right: parent.right
            anchors.rightMargin: Math.round(86 * Theme.scale)
            anchors.verticalCenter: parent.verticalCenter
            spacing: Math.round(18 * Theme.scale)

            Text {
                text: vehicleData.simulationActive ? "SIM" : "OFF"
                color: vehicleData.simulationActive ? Colors.accentEco : Colors.textMuted
                font.family: Typography.family
                font.pixelSize: Typography.label
                font.weight: Font.DemiBold
            }

            Text {
                text: vehicleData.driveMode
                color: vehicleData.driveMode === "Sport" ? Colors.accentSport
                    : vehicleData.driveMode === "City" ? Colors.accentCity
                    : Colors.accentEco
                font.family: Typography.family
                font.pixelSize: Typography.label
                font.weight: Font.DemiBold
            }

            Text {
                text: Math.round(vehicleData.batteryPercent) + "%"
                color: Colors.textSecondary
                font.family: Typography.family
                font.pixelSize: Typography.label
                font.weight: Font.DemiBold
            }
        }

        Rectangle {
            anchors.right: parent.right
            anchors.rightMargin: Theme.pageMargin
            anchors.verticalCenter: parent.verticalCenter
            width: Math.round(52 * Theme.scale)
            height: Math.round(34 * Theme.scale)
            radius: Math.round(5 * Theme.scale)
            color: Colors.surfaceBase
            border.color: Colors.borderSubtle
            border.width: 1

            Text {
                anchors.centerIn: parent
                text: "SET"
                color: Colors.textMuted
                font.family: Typography.family
                font.pixelSize: Typography.label
                font.weight: Font.Medium
            }

            MouseArea {
                anchors.fill: parent
                onClicked: root.currentPageIndex = 2
            }
        }
    }

    Loader {
        id: pageLoader
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: topBar.bottom
        anchors.bottom: navBar.top
        anchors.leftMargin: Theme.pageMargin
        anchors.rightMargin: Theme.pageMargin
        anchors.topMargin: Math.round(4 * Theme.scale)
        anchors.bottomMargin: Math.round(8 * Theme.scale)
        sourceComponent: root.currentPageIndex === 0 ? homePage
            : root.currentPageIndex === 1 ? musicPage
            : root.currentPageIndex === 2 ? settingsPage
            : diagnosticsPage
    }

    Rectangle {
        id: navBar
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: Theme.navBarHeight
        color: "#D0030405"

        Row {
            anchors.centerIn: parent
            spacing: Math.round(8 * Theme.scale)

            Repeater {
                model: root.pages.length

                Rectangle {
                    width: Math.round(124 * Theme.scale)
                    height: Math.round(46 * Theme.scale)
                    radius: Math.round(8 * Theme.scale)
                    color: root.currentPageIndex === index ? Colors.surfaceBase : "transparent"
                    border.color: root.currentPageIndex === index ? Colors.borderWarm : Colors.borderSubtle
                    border.width: 1

                    Behavior on color {
                        ColorAnimation {
                            duration: Theme.motionFast
                            easing.type: Easing.OutCubic
                        }
                    }

                    Text {
                        anchors.centerIn: parent
                        text: root.pages[index].label
                        color: root.currentPageIndex === index ? Colors.textPrimary : Colors.textMuted
                        font.family: Typography.family
                        font.pixelSize: Typography.bodySmall
                        font.weight: root.currentPageIndex === index ? Font.DemiBold : Font.Medium
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: root.currentPageIndex = index
                    }
                }
            }
        }
    }

    Component {
        id: homePage
        HomePage {}
    }

    Component {
        id: musicPage
        MusicPage {}
    }

    Component {
        id: settingsPage
        SettingsPage {}
    }

    Component {
        id: diagnosticsPage
        DiagnosticsPage {}
    }
}
