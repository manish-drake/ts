#include "loggingmodel.h"
#include "loggingdao.h"
using namespace std;

LoggingModel::LoggingModel(QObject *parent):
    ModelBase(parent),
    m_db(DataManager::instance()),
    m_logging(m_db.loggingDao()->logs())
{
}


QModelIndex LoggingModel::addLogging(Logging &logging)
{
    int row = this->rowCount();
    beginInsertRows(QModelIndex(), row, row);
    auto loggingDao = this->m_db.loggingDao();
//        const logging *loggingPtr = &logging;

//        unique_ptr<logging> newlogging(logging);
    loggingDao->addLogging(logging);
    endInsertRows();
    this->m_logging->push_back(unique_ptr<Logging>(&logging));
    return index(row, 0);
}

void LoggingModel::addLogging(const QDateTime &dtLog, const QString &data, const QString &file, const int &line, const QString &function)
{
    std::unique_ptr<Logging> un_pt_logging(new Logging());
    un_pt_logging->setDtLog(dtLog);
    un_pt_logging->setData(data);
    un_pt_logging->setFile(file);
    un_pt_logging->setLine(line);
    un_pt_logging->setFunction(function);

    auto loggingDao = this->m_db.loggingDao();
    loggingDao->addLogging(*un_pt_logging);
}

int LoggingModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    auto sz = this->m_logging->size();
    return sz;
}

QVariant LoggingModel::data(const QModelIndex &index, int role) const
{
    if(isIndexValid(index)){
        int rowIndex = index.row();
        const Logging &logging = *m_logging->at(rowIndex);

        switch (role) {
        case Roles::IDRole:
            return logging.id();
        case Roles::DtLogRole:
            return logging.dtLog();
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
        Logging &logging = *m_logging->at(index.row());
        switch (role) {
        case Roles::DtLogRole:
            logging.setDtLog(value.toDateTime());
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
        const Logging &logging = *m_logging->at(row + countLeft);
        m_db.loggingDao()->removeLogging(logging.id());
    }
    m_logging->erase(m_logging->begin() + row, m_logging->begin() + row + count);
    endRemoveRows();
    return true;
}
QHash<int, QByteArray> LoggingModel::roleNames() const
{
    QHash<int, QByteArray> hash;
    hash.insert(Roles::IDRole, "id");
    hash.insert(Roles::DtLogRole, "dtLog");
    hash.insert(Roles::DataRole, "data");
    hash.insert(Roles::FileRole, "file");
    hash.insert(Roles::LineRole, "line");
    hash.insert(Roles::FunctionRole, "function");
    return hash;
}

LoggingModel::~LoggingModel()
{

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
