/* This file is part of:
 *    Jalali, a Gregorian to Jalali and inverse date convertor
 * Copyright (C) 2001  Roozbeh Pournader <roozbeh@sharif.edu>
 * Copyright (C) 2001  Mohammad Toossi <mohammad@bamdad.org>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You can receive a copy of GNU Lesser General Public License at the
 * World Wide Web address <http://www.gnu.org/licenses/lgpl.html>.
 *
 * For licensing issues, contact The FarsiWeb Project Group,
 * Computing Center, Sharif University of Technology,
 * PO Box 11365-8515, Tehran, Iran, or contact us the
 * email address <FWPG@sharif.edu>.
 */

/* Changes:
 * 2010-Jan-26:
 *      Qt compatible code --Majid Ramezanpour (maour) majid.ramezanpour@gmail.com
 *
 * 2005-Sep-06:
 *      General cleanup  --Behdad Esfahbod
 *
 * 2001-Sep-21:
 *	Fixed a bug with "30 Esfand" dates, reported by Mahmoud Ghandi
 *
 * 2001-Sep-20:
 *	First LGPL release, with both sides of conversions
 */

#ifndef JALALI_H
#define JALALI_H

#include <QObject>
#include <QVector>
#include <QStringList>
#include <QDate>

class Jalali : public QObject
{
    Q_OBJECT
public:
    explicit Jalali(QObject *parent = 0);

    QString currentDate();
    QString gregorianToJalali(QDate);

    QString currentDay();
    QString currentMonth();

    QString currentDayName();
private:
    QVector<int> g_days_in_month_list;
    QVector<int> j_days_in_month_list;
    QStringList j_month_name_list;
};

#endif // JALALI_H
