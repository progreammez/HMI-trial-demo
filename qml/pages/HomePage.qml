import QtQuick
import EvHmi

Item {
    BaseCard {
        id: speedCard
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: parent.width * 0.48
        title: "Drive"
        baseColor: Colors.surfaceRaised

        Text {
            anchors.centerIn: parent
            text: Math.round(vehicleData.speedKph)
            color: Colors.textPrimary
            font.family: Typography.family
            font.pixelSize: Typography.displayLarge
            font.weight: Font.Light
            letterSpacing: 0
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.verticalCenter
            anchors.topMargin: Math.round(58 * Theme.scale)
            text: "km/h"
            color: Colors.textSecondary
            font.family: Typography.family
            font.pixelSize: Typography.bodyLarge
            letterSpacing: 0
        }

        Text {
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            text: vehicleData.gear
            color: Colors.accentEco
            font.family: Typography.family
            font.pixelSize: Typography.titleLarge
            font.weight: Font.DemiBold
            letterSpacing: 0
        }
    }

    Grid {
        anchors.left: speedCard.right
        anchors.leftMargin: Theme.cardGap
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        columns: 2
        rows: 2
        spacing: Theme.cardGap

        BaseCard {
            width: (parent.width - Theme.cardGap) / 2
            height: (parent.height - Theme.cardGap) / 2
            title: "Battery"

            Text {
                anchors.centerIn: parent
                text: Math.round(vehicleData.batteryPercent) + "%"
                color: Colors.textPrimary
                font.family: Typography.family
                font.pixelSize: Typography.displayMedium
                font.weight: Font.Light
                letterSpacing: 0
            }
        }

        BaseCard {
            width: (parent.width - Theme.cardGap) / 2
            height: (parent.height - Theme.cardGap) / 2
            title: "Range"

            Text {
                anchors.centerIn: parent
                text: Math.round(vehicleData.estimatedRangeKm) + " km"
                color: Colors.textPrimary
                font.family: Typography.family
                font.pixelSize: Typography.titleLarge
                font.weight: Font.DemiBold
                letterSpacing: 0
            }
        }

        BaseCard {
            width: (parent.width - Theme.cardGap) / 2
            height: (parent.height - Theme.cardGap) / 2
            title: "Thermal"

            Text {
                anchors.centerIn: parent
                text: Math.round(vehicleData.motorTemperatureC) + " / "
                    + Math.round(vehicleData.batteryTemperatureC) + " C"
                color: Colors.textPrimary
                font.family: Typography.family
                font.pixelSize: Typography.titleMedium
                font.weight: Font.DemiBold
                letterSpacing: 0
            }
        }

        BaseCard {
            width: (parent.width - Theme.cardGap) / 2
            height: (parent.height - Theme.cardGap) / 2
            title: "Odometer"

            Text {
                anchors.centerIn: parent
                text: Math.round(vehicleData.odometerKm).toLocaleString(Qt.locale()) + " km"
                color: Colors.textPrimary
                font.family: Typography.family
                font.pixelSize: Typography.titleMedium
                font.weight: Font.DemiBold
                letterSpacing: 0
            }
        }
    }
}
