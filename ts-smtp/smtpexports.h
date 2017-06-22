#ifndef SMTPEXPORTS_H
#define SMTPEXPORTS_H

#include <QtCore/qglobal.h>

#ifdef SMTP_BUILD
#define TSSMTPSHARED_EXPORT Q_DECL_EXPORT
#else
#define TSSMTPSHARED_EXPORT Q_DECL_IMPORT
#endif

#endif // SMTPEXPORTS_H
