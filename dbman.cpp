#include "dbman.h"

#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QVariant>
#include <QDebug>

DbMan::DbMan(QObject *parent) :
    QObject(parent)
{
}

void DbMan::addInfo(QString devCode, QString patientName, QString patientPhone, qreal leftEyeSPH, qreal leftEyeCyl, qreal leftEyeAx, qreal rightEyeSPH, qreal rightEyeCyl, qreal rightEyeAx, QString lensType, QString detail, bool syncState)
{
    if (!createConnection())
        return;

    QSqlQuery query;
    query.prepare("INSERT INTO patientinfo (deviceCode , name , phone , leftEye1 ,leftEye2 ,leftEye3 , rightEye1 ,rightEye2 , rightEye3, lensType,detail, synced)"
                  " VALUES (:DeviceCode, :PatientName,:PatientPhone ,:LeftEyeSPH, :LeftEyeCyl, :LeftEyeAx,:RightEyeSPH, :RightEyeCyl, :RightEyeAx, :LensType, :Detail, :SyncState)");

    query.bindValue(":DeviceCode", devCode);
    query.bindValue(":PatientName", patientName );
    query.bindValue(":PatientPhone", patientPhone);
    query.bindValue(":LeftEyeSPH", leftEyeSPH);
    query.bindValue(":LeftEyeCyl", leftEyeCyl);
    query.bindValue(":LeftEyeAx", leftEyeAx);
    query.bindValue(":RightEyeSPH", rightEyeSPH);
    query.bindValue(":RightEyeCyl", rightEyeCyl);
    query.bindValue(":RightEyeAx", rightEyeAx);
    query.bindValue(":LensType", lensType);
    query.bindValue(":Detail", detail);
    query.bindValue(":SyncState", syncState);
    query.exec();
}

bool DbMan::createConnection()
{
    if ( QSqlDatabase::database().isOpen ()) {
        return true;
    }
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE"); //default connection
    db.setDatabaseName("data/database.db");

    if (!db.open()){
        qDebug()<<db.lastError();
        return false;
    }

    QSqlQuery query;
    query.exec("create table patientinfo (deviceCode varchar(4), name varchar(25), phone varchar(15) , leftEye1 NUMERIC(2,2),leftEye2 NUMERIC(2,2),leftEye3 NUMERIC(2,2), rightEye1 NUMERIC(2,2),rightEye2 NUMERIC(2,2),rightEye3 NUMERIC(2,2),"
               " lensType varchar(6),detail varchar(200), synced bool DEFAULT ('false'))");


    return true;

}
