#include "jalali.h"
#include <QVariant>
#include <QLocale>
#include <QDate>

Jalali::Jalali(QObject *parent) :
        QObject(parent)
{
    g_days_in_month_list << 31 << 28 << 31 << 30 << 31 << 30 << 31 << 31 << 30 << 31 << 30 << 31;
    j_days_in_month_list << 31 << 31 << 31 << 31 << 31 << 31 << 30 << 30 << 30 << 30 << 30 << 29;

    j_month_name_list << "" << "Farvardin" << "Ordibehesht" << "Khordad"
            << "Tir" << "Mordad" << "Shahrivar"
            << "Mehr" << "Aban" << "Azar"
            << "Dey" << "Bahman" << "Esfand";
}

QString Jalali::currentDate()
{
    QString currentJDate;//, currentDate;

    currentJDate = gregorianToJalali(QDate::currentDate());

    return currentJDate;
}

QString Jalali::currentDay()
{
    QString currentJDate;
    currentJDate = gregorianToJalali(QDate::currentDate());

    return currentJDate.section ("/",2,-1);

}

QString Jalali::currentDayName()
{
    QDate currentDayName;
    currentDayName = QDate::currentDate ();

    QString dayName;
    switch ( currentDayName.dayOfWeek ()) {
    case 1: dayName = QString(trUtf8 ("دوشنبه"));
        break;
    case 2: dayName =  QString(trUtf8 ("سه‌شنبه"));
        break;
    case 3: dayName = QString(trUtf8 ("چهارشنبه"));
        break;
    case 4: dayName =  QString(trUtf8 ("پنج‌شنبه"));
        break;
    case 5: dayName = QString(trUtf8 ("جمعه"));
        break;
    case 6: dayName =  QString(trUtf8 ("شنبه"));
        break;
    case 7: dayName = QString(trUtf8 ("یکشنبه"));
        break;
    }
    return dayName;
}

QString Jalali::currentMonth()
{
    QString currentJDate;
    currentJDate = gregorianToJalali(QDate::currentDate());//.toString(Qt::ISODate);

    QVariant month = currentJDate.section ("/",1,1);

    switch (month.toInt ()) {
    case 1: month = QString(trUtf8 ("فروردین"));
        break;
    case 2: month =  QString(trUtf8 ("اردیبهشت"));
        break;
    case 3: month = QString(trUtf8 ("خرداد"));
        break;
    case 4: month =  QString(trUtf8 ("تیر"));
        break;
    case 5: month = QString(trUtf8 ("مرداد"));
        break;
    case 6: month =  QString(trUtf8 ("شهریور"));
        break;
    case 7: month = QString(trUtf8 ("مهر"));
        break;
    case 8: month =  QString(trUtf8 ("آبان"));
        break;
    case 9: month = QString(trUtf8 ("آذر"));
        break;
    case 10: month =  QString(trUtf8 ("دی"));
        break;
    case 11: month = QString(trUtf8 ("بهمن"));
        break;
    case 12: month =  QString(trUtf8 ("اسفند"));
        break;
    }

    return month.toString ();
}

QString Jalali::gregorianToJalali(QDate gregorian)
{
    QString jalali;

    int gy, gm, gd;
    int jy, jm, jd;
    long g_day_no, j_day_no;
    int j_np;

    int i;


    int gYear = gregorian.year();
    int gMonth = gregorian.month();
    int gDay = gregorian.day();

    gy = gYear - 1600;
    gm = gMonth - 1;
    gd = gDay - 1;

    g_day_no = 365*gy + (gy+3)/4 - (gy+99)/100 + (gy+399)/400;
    for ( i=0 ; i<gm ; ++i )
    {
        g_day_no += g_days_in_month_list.at(i);
    }


    if (gm>1 && ((gy%4==0 && gy%100!=0) || (gy%400==0)))  /* leap and after Feb */
        ++g_day_no;

    g_day_no += gd;

    j_day_no = g_day_no-79;

    j_np = j_day_no / 12053;
    j_day_no %= 12053;

    jy = 979+33*j_np+4*(j_day_no/1461);
    j_day_no %= 1461;

    if (j_day_no >= 366) {
        jy += (j_day_no-1)/365;
        j_day_no = (j_day_no-1)%365;
    }

    for (i = 0; i < 11 && j_day_no >= j_days_in_month_list.at(i); ++i) {
        j_day_no -= j_days_in_month_list.at(i);
    }
    jm = i+1;
    jd = j_day_no+1;

    QVariant jyS=jy,jmS=jm,jdS=jd;
    if (jmS.toString ().length ()<2)
        jmS =  jmS.toString ().prepend ("0");
    if (jdS.toString ().length ()<2)
        jdS = jdS.toString ().prepend ("0");

    jalali = jyS.toString () + "/" + jmS.toString () + "/" + jdS.toString ();

    return jalali;
}
