#ifndef TSDAO_GLOBAL_H
#define TSDAO_GLOBAL_H

#include <QtCore/qglobal.h>

#if defined(TSDAO_LIBRARY)
#  define TSDAOSHARED_EXPORT Q_DECL_EXPORT
#else
#  define TSDAOSHARED_EXPORT Q_DECL_IMPORT
#endif

#endif // TSDAO_GLOBAL_H
