#ifndef TSSMTP_GLOBAL_H
#define TSSMTP_GLOBAL_H

#include <QtCore/qglobal.h>

#if defined(TSSMTP_LIBRARY)
#  define TSSMTPSHARED_EXPORT Q_DECL_EXPORT
#else
#  define TSSMTPSHARED_EXPORT Q_DECL_IMPORT
#endif

#endif // TSSMTP_GLOBAL_H
