#ifndef TSCLIENT_GLOBAL_H
#define TSCLIENT_GLOBAL_H

#include <QtCore/qglobal.h>

#if defined(TSCLIENT_LIBRARY)
#  define TSCLIENTSHARED_EXPORT Q_DECL_EXPORT
#else
#  define TSCLIENTSHARED_EXPORT Q_DECL_IMPORT
#endif

#endif // TSCLIENT_GLOBAL_H
