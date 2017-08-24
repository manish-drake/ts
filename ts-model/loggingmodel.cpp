#include "loggingmodel.h"
#include "loggingdao.h"
#include <QDebug>

using namespace std;

LoggingModel::LoggingModel(QObject *parent):
    m_db(DataManager::logger())
{
}
/*
int LoggingModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    auto sz = this->m_logs->size();
    return sz;
}

QVariant LoggingModel::data(const QModelIndex &index, int role) const
{
    if(isIndexValid(index)){
        int rowIndex = index.row();
        const Logging &logging = *m_logs->at(rowIndex);

        switch (role) {
        case Roles::IDRole:
            return logging.id();
        case Roles::DtLogRole:
            return logging.dtLog();
        case Roles::MsgTypeRole:
            return logging.msgType();
        case Roles::DataRole:
            return logging.data();
        case Roles::FileRole:
            return logging.file();
        case Roles::LineRole:
            return logging.line();
        case Roles::FunctionRole:
            return logging.function();
        default:
            return QVariant();
        }
    } else {
        return QVariant();
    }

}

bool LoggingModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if(isIndexValid(index)) {
        Logging &logging = *m_logs->at(index.row());
        switch (role) {
        case Roles::DtLogRole:
            logging.setDtLog(value.toDateTime());
            break;
        case Roles::MsgTypeRole:
            logging.setMsgType(value.toInt());
            break;
        case Roles::DataRole:
            logging.setData(value.toString());
            break;
        case Roles::FileRole:
            logging.setFile(value.toString());
            break;
        case Roles::LineRole:
            logging.setLine(value.toInt());
            break;
        case Roles::FunctionRole:
            logging.setFunction(value.toString());
            break;
        default:
            break;
        }
        emit dataChanged(index, index);
        return true;
    } else {
        return false;
    }
}

bool LoggingModel::removeRows(int row, int count, const QModelIndex &parent)
{
    if (row < 0
            || row >= rowCount()
            || count < 0
            || (row + count) > rowCount()) {
        return false;
    }
    beginRemoveRows(parent, row, row + count -1);
    int countLeft = count;
    while (countLeft--) {
        const Logging &logging = *m_logs->at(row + countLeft);
        m_db.loggingDao()->removeLogging(logging.id());
    }
    m_logs->erase(m_logs->begin() + row, m_logs->begin() + row + count);
    endRemoveRows();
    return true;
}
QHash<int, QByteArray> LoggingModel::roleNames() const
{
    QHash<int, QByteArray> hash;
    hash.insert(Roles::IDRole, "id");
    hash.insert(Roles::DtLogRole, "dtLog");
    hash.insert(Roles::MsgTypeRole, "msgType");
    hash.insert(Roles::DataRole, "data1");
    hash.insert(Roles::FileRole, "file");
    hash.insert(Roles::LineRole, "line");
    hash.insert(Roles::FunctionRole, "function");
    return hash;
}

int LoggingModel::getRowIndexByID(const int id) const
{
    int row = -1, idx = 0;
    for(auto &item: *m_logs){
        if(item->id() == id)
        {
            row = idx;
            break;
        }
        idx += 1;
    }
    return row;
}

void LoggingModel::qualifyByView(const int view)
{
    Q_UNUSED(view)
}

bool LoggingModel::isIndexValid(const QModelIndex &index) const
{
    int row = index.row();
    if((row < 0)
            || (row >= rowCount())
            || (!index.isValid())){
        return false;
    } else {
        return true;
    }
}

*/

void LoggingModel::log(const QString &data)
{
    qInfo() << data;
}

QVariant LoggingModel::logs()
{
    QStringList dataList;
    auto logs = m_db.loggingDao()->logs();
    QDateTime dt;
    for(auto &log: *logs){
        QDateTime dtLog = log->dtLog();
        QDateTime now = QDateTime::currentDateTime();
        qint64 x = dtLog.daysTo(now);
        qint64 y = dt.daysTo(now);
        if(x != y){
            dt = dtLog;
            QString date = dtLog.date().toString(Qt::DateFormat::DefaultLocaleLongDate);
            dataList.append("");
            dataList.append(date);
            dataList.append("-------------------------------------");
        }

        QString msg = log->data();
        QString time = dtLog.time().toString("HH:mm:ss.zzz");
        dataList.append(time + ": " + msg);
    }
    return QVariant::fromValue(dataList);
}

LoggingModel::~LoggingModel()
{

}

