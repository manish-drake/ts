#ifndef TSCORE_GLOBAL_H
#define TSCORE_GLOBAL_H

#include <QtCore/qglobal.h>

#if defined(TSCORE_LIBRARY)
#  define TSCORESHARED_EXPORT Q_DECL_EXPORT
#else
#  define TSCORESHARED_EXPORT Q_DECL_IMPORT
#endif

#endif // TSCORE_GLOBAL_H
