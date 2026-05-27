#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QUrl>

#include "backend/VehicleDataManager.h"
#include "models/VehicleTelemetry.h"
#include "simulations/TelemetrySimulator.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QGuiApplication::setApplicationName(QStringLiteral("EV HMI"));
    QGuiApplication::setOrganizationName(QStringLiteral("ApexLab"));

    qRegisterMetaType<VehicleTelemetry>("VehicleTelemetry");

    VehicleDataManager vehicleData;
    TelemetrySimulator telemetrySimulator;

    QObject::connect(&telemetrySimulator,
                     &TelemetrySimulator::telemetryUpdated,
                     &vehicleData,
                     &VehicleDataManager::applyTelemetry);

    QObject::connect(&telemetrySimulator,
                     &TelemetrySimulator::runningChanged,
                     &vehicleData,
                     &VehicleDataManager::setSimulationActive);

    QObject::connect(&vehicleData,
                     &VehicleDataManager::driveModeRequested,
                     &telemetrySimulator,
                     &TelemetrySimulator::setDriveMode);

    QObject::connect(&vehicleData,
                     &VehicleDataManager::gearRequested,
                     &telemetrySimulator,
                     &TelemetrySimulator::setGear);

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty(QStringLiteral("vehicleData"), &vehicleData);

    engine.load(QUrl(QStringLiteral("qrc:/qt/qml/EvHmi/qml/Main.qml")));
    if (engine.rootObjects().isEmpty()) {
        return -1;
    }

    telemetrySimulator.start();

    return app.exec();
}
