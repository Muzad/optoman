#include "patientsqlmodel.h"
#include <QHash>
#include <QByteArray>
#include <QtSql/QSqlDatabase>
#include <QDebug>
#include <QtSql/QSqlError>
#include <QtSql/QSqlQuery>
#include <QtSql/QSqlDriver>
#include <QtSql/QSqlQueryModel>

const char* PatientSqlModel::COLUMN_NAMES[] = {
    "deviceCode",
    "name",
    "phone",
    "leftEyeSph",
    "leftEyeCyl",
    "leftEyeAx",
    "rightEyeSph",
    "rightEyeCyl",
    "rightEyeAx",
    "lensType",
    "detail",
    "synced",
    NULL
};

#if QT_VERSION > 0x050000
QHash<int, QByteArray> PatientSqlModel::roleNames() const {
    QHash<int, QByteArray> roleNames;

    int idx = 0;
    while( COLUMN_NAMES[idx]) {
        roleNames[Qt::UserRole + idx + 1] = COLUMN_NAMES[idx];
        idx++;
    }
    return roleNames;
}
#endif

PatientSqlModel::PatientSqlModel(QObject *parent)://,int tableID) :
    QSqlQueryModel(parent) //, patientPhone(tableID)
{
    SQL_SELECT ="SELECT * FROM patientinfo";//WHERE phone='"+patientPhone.toString ()+"'";

#if QT_VERSION < 0x050000
    int idx = 0;
    while( COLUMN_NAMES[idx]) {
        roleNames[Qt::UserRole + idx + 1] = COLUMN_NAMES[idx];
        idx++;
    }
    setRoleNames(roleNames);
#endif

    reload ();

}

void PatientSqlModel::reload()
{
    setQuery(SQL_SELECT );//, QSqlDatabase::database ());
}



QVariant PatientSqlModel::data(const QModelIndex &index, int role) const
{
    QVariant value = QSqlQueryModel::data(index, role);
    if(role < Qt::UserRole)
    {
        value = QSqlQueryModel::data(index, role);
    }
    else
    {
        int columnIdx = role - Qt::UserRole - 1;
        QModelIndex modelIndex = this->index(index.row(), columnIdx);
        value = QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
    }
    return value;
}
