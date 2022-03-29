#include <iostream>

class Log
{
public:
    enum Level : int
    {
        ERROR = 0,
        WARNING,
        INFO
    };

private:
    Level m_LogLevel = INFO;

public:
    Log(/* args */);
    ~Log();
    void SetLevel(int level);
    void Error(const char *message);
    void Warn(const char *message);
    void Info(const char *message);
};

Log::Log(/* args */)
{
}

Log::~Log()
{
}

void Log::SetLevel(Level level)
{
    m_LogLevel = level;
}

void Log::Error(const char *message)
{
    if (m_LogLevel >= ERROR)
        std::cout << "[ERROR]" << message << std::endl;
}

void Log::Warn(const char *message)
{
    if (m_LogLevel >= WARNING)
        std::cout << "[WARNING]" << message << std::endl;
}

void Log::Info(const char *message)
{
    if (m_LogLevel >= INFO)
        std::cout << "[INFO]" << message << std::endl;
}

int main()
{
    Log log;
    log.SetLevel(Log::WARNING);
    log.Warn("Hello");

    std::cin.get();
}