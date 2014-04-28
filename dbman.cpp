#include "dbman.h"

#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QVariant>
#include <QDebug>
#include "patientsqlmodel.h"
#include <QQmlContext>

void DbMan::setGlobalViewer(QQuickView *view)
{
    viewer = view ;
}

PatientSqlModel *DbMan::model()
{
    if (!createConnection()){
        qDebug()<<"Failed";
    }

    patientModel = new PatientSqlModel(this);
    return patientModel;
}

void DbMan::reloadModel()
{
    viewer->rootContext ()->setContextProperty("patientmodel", this->model ());
}

DbMan::DbMan(QObject *parent) :
    QObject(parent)
{
}

void DbMan::addInfo(QString devCode, QString patientName, QString patientPhone, qreal leftEyeSPH, qreal leftEyeCyl, qreal leftEyeAx, qreal rightEyeSPH, qreal rightEyeCyl, qreal rightEyeAx, QString lensType, QString detail, bool syncState)
{
    if (!createConnection())
        return;

    QSqlQuery query;
    query.prepare("INSERT INTO patientinfo (deviceCode , name , phone , leftEyeSph ,leftEyeCyl ,leftEyeAx , rightEyeSph ,rightEyeCyl , rightEyeAx, lensType, detail, synced)"
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
    query.bindValue(":SyncState", syncState); //cloud backend
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
    query.exec("create table patientinfo (deviceCode varchar(4), name varchar(25), phone varchar(15) , leftEyeSph NUMERIC(2,2),leftEyeCyl NUMERIC(2,2),leftEyeAx NUMERIC(2,2), rightEyeSph NUMERIC(2,2),rightEyeCyl NUMERIC(2,2),rightEyeAx NUMERIC(2,2),"
               " lensType varchar(6),detail varchar(200), synced bool DEFAULT ('false'))");

    return true;
}

