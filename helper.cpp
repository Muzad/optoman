#include "helper.h"
#include "calendar/jalali.h"
#include "QDateTime"
#include <QDebug>

Helper::Helper(QObject *parent) : QObject(parent)
{

}

QString Helper::gregorianToJalali(QString dateTime)
{
    QString time,date;
    Jalali jCalender;
//    QLocale::setDefault(QLocale(QLocale::English, QLocale::UnitedStates));
//    QLocale local;
    time = QDateTime::fromString(dateTime,"yyyy-MM-ddThh:mm:ss.zzz").time().toString();
    date= jCalender.gregorianToJalali(QDateTime::fromString(dateTime,"yyyy-MM-ddThh:mm:ss.zzz").date());
    return date+" "+time;
}

