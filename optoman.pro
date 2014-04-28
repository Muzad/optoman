QT += sql
# Add more folders to ship with the application, here
folder_01.source = qml/optoman
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    dbman.cpp \
    patientsqlmodel.cpp

# Installation path
# target.path =

# Please do not modify the following two lines. Required for deployment.
include(qtquick2applicationviewer/qtquick2applicationviewer.pri)
qtcAddDeployment()

HEADERS += \
    dbman.h \
    patientsqlmodel.h

OTHER_FILES += \
    qml/optoman/component/EyeReel.qml
