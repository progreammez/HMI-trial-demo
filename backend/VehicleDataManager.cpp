#include "backend/VehicleDataManager.h"

#include <QStringList>

VehicleDataManager::VehicleDataManager(QObject *parent)
    : QObject(parent)
{
}

double VehicleDataManager::speedKph() const
{
    return m_telemetry.speedKph;
}

double VehicleDataManager::rpm() const
{
    return m_telemetry.rpm;
}

double VehicleDataManager::batteryPercent() const
{
    return m_telemetry.batteryPercent;
}

double VehicleDataManager::motorTemperatureC() const
{
    return m_telemetry.motorTemperatureC;
}

double VehicleDataManager::batteryTemperatureC() const
{
    return m_telemetry.batteryTemperatureC;
}

double VehicleDataManager::odometerKm() const
{
    return m_telemetry.odometerKm;
}

double VehicleDataManager::estimatedRangeKm() const
{
    return m_telemetry.estimatedRangeKm;
}

QString VehicleDataManager::gear() const
{
    return m_telemetry.gear;
}

QString VehicleDataManager::driveMode() const
{
    return m_telemetry.driveMode;
}

bool VehicleDataManager::simulationActive() const
{
    return m_simulationActive;
}

void VehicleDataManager::applyTelemetry(const VehicleTelemetry &telemetry)
{
    const bool gearWasChanged = m_telemetry.gear != telemetry.gear;
    const bool driveModeWasChanged = m_telemetry.driveMode != telemetry.driveMode;

    m_telemetry = telemetry;

    emit telemetryChanged();

    if (gearWasChanged) {
        emit gearChanged();
    }

    if (driveModeWasChanged) {
        emit driveModeChanged();
    }
}

void VehicleDataManager::setGear(const QString &gear)
{
    const QString normalized = normalizedGear(gear);
    if (normalized.isEmpty() || normalized == m_telemetry.gear) {
        return;
    }

    m_telemetry.gear = normalized;
    emit gearChanged();
    emit telemetryChanged();
    emit gearRequested(normalized);
}

void VehicleDataManager::setDriveMode(const QString &driveMode)
{
    const QString normalized = normalizedDriveMode(driveMode);
    if (normalized.isEmpty() || normalized == m_telemetry.driveMode) {
        return;
    }

    m_telemetry.driveMode = normalized;
    emit driveModeChanged();
    emit telemetryChanged();
    emit driveModeRequested(normalized);
}

void VehicleDataManager::setSimulationActive(bool active)
{
    if (m_simulationActive == active) {
        return;
    }

    m_simulationActive = active;
    emit simulationActiveChanged();
}

QString VehicleDataManager::normalizedGear(const QString &gear)
{
    const QString value = gear.trimmed().toUpper();
    static const QStringList validGears = {
        QStringLiteral("P"),
        QStringLiteral("R"),
        QStringLiteral("N"),
        QStringLiteral("D"),
    };

    return validGears.contains(value) ? value : QString();
}

QString VehicleDataManager::normalizedDriveMode(const QString &driveMode)
{
    const QString value = driveMode.trimmed().toLower();

    if (value == QStringLiteral("eco")) {
        return QStringLiteral("Eco");
    }

    if (value == QStringLiteral("city")) {
        return QStringLiteral("City");
    }

    if (value == QStringLiteral("sport")) {
        return QStringLiteral("Sport");
    }

    return QString();
}
