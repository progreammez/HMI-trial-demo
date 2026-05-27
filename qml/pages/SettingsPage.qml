import QtQuick
import EvHmi

Item {
    Grid {
        anchors.fill: parent
        columns: 3
        spacing: Theme.cardGap

        BaseCard {
            width: (parent.width - Theme.cardGap * 2) / 3
            height: parent.height
            title: "Vehicle"

            Text {
                anchors.centerIn: parent
                text: vehicleData.driveMode
                color: vehicleData.driveMode === "Sport" ? Colors.accentSport
                    : vehicleData.driveMode === "City" ? Colors.accentCity
                    : Colors.accentEco
                font.family: Typography.family
                font.pixelSize: Typography.titleLarge
                font.weight: Font.DemiBold
                letterSpacing: 0
            }
        }

        BaseCard {
            width: (parent.width - Theme.cardGap * 2) / 3
            height: parent.height
            title: "Display"

            Text {
                anchors.centerIn: parent
                text: "Dark"
                color: Colors.textPrimary
                font.family: Typography.family
                font.pixelSize: Typography.titleLarge
                font.weight: Font.DemiBold
                letterSpacing: 0
            }
        }

        BaseCard {
            width: (parent.width - Theme.cardGap * 2) / 3
            height: parent.height
            title: "System"

            Text {
                anchors.centerIn: parent
                text: vehicleData.simulationActive ? "Online" : "Offline"
                color: vehicleData.simulationActive ? Colors.accentEco : Colors.textMuted
                font.family: Typography.family
                font.pixelSize: Typography.titleLarge
                font.weight: Font.DemiBold
                letterSpacing: 0
            }
        }
    }
}
