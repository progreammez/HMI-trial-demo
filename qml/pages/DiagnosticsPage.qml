import QtQuick
import EvHmi

Item {
    Grid {
        anchors.fill: parent
        columns: 3
        rows: 2
        spacing: Theme.cardGap

        BaseCard {
            width: (parent.width - Theme.cardGap * 2) / 3
            height: (parent.height - Theme.cardGap) / 2
            title: "Speed"

            Text {
                anchors.centerIn: parent
                text: vehicleData.speedKph.toFixed(1) + " km/h"
                color: Colors.textPrimary
                font.family: Typography.family
                font.pixelSize: Typography.titleMedium
                font.weight: Font.DemiBold
                letterSpacing: 0
            }
        }

        BaseCard {
            width: (parent.width - Theme.cardGap * 2) / 3
            height: (parent.height - Theme.cardGap) / 2
            title: "RPM"

            Text {
                anchors.centerIn: parent
                text: Math.round(vehicleData.rpm)
                color: Colors.textPrimary
                font.family: Typography.family
                font.pixelSize: Typography.titleMedium
                font.weight: Font.DemiBold
                letterSpacing: 0
            }
        }

        BaseCard {
            width: (parent.width - Theme.cardGap * 2) / 3
            height: (parent.height - Theme.cardGap) / 2
            title: "Battery"

            Text {
                anchors.centerIn: parent
                text: vehicleData.batteryPercent.toFixed(1) + "%"
                color: Colors.textPrimary
                font.family: Typography.family
                font.pixelSize: Typography.titleMedium
                font.weight: Font.DemiBold
                letterSpacing: 0
            }
        }

        BaseCard {
            width: (parent.width - Theme.cardGap * 2) / 3
            height: (parent.height - Theme.cardGap) / 2
            title: "Motor Temp"

            Text {
                anchors.centerIn: parent
                text: vehicleData.motorTemperatureC.toFixed(1) + " C"
                color: Colors.textPrimary
                font.family: Typography.family
                font.pixelSize: Typography.titleMedium
                font.weight: Font.DemiBold
                letterSpacing: 0
            }
        }

        BaseCard {
            width: (parent.width - Theme.cardGap * 2) / 3
            height: (parent.height - Theme.cardGap) / 2
            title: "Battery Temp"

            Text {
                anchors.centerIn: parent
                text: vehicleData.batteryTemperatureC.toFixed(1) + " C"
                color: Colors.textPrimary
                font.family: Typography.family
                font.pixelSize: Typography.titleMedium
                font.weight: Font.DemiBold
                letterSpacing: 0
            }
        }

        BaseCard {
            width: (parent.width - Theme.cardGap * 2) / 3
            height: (parent.height - Theme.cardGap) / 2
            title: "STM32"

            Text {
                anchors.centerIn: parent
                text: vehicleData.simulationActive ? "Simulated" : "Disconnected"
                color: vehicleData.simulationActive ? Colors.accentEco : Colors.textMuted
                font.family: Typography.family
                font.pixelSize: Typography.titleMedium
                font.weight: Font.DemiBold
                letterSpacing: 0
            }
        }
    }
}
