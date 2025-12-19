#include "readfile.h"
#include <fstream>
#include <iostream>
#include <QString>

using namespace std;

readFile::readFile(QObject *parent) : QObject(parent)
{

}

std::string getFileNamePath(QString value)
{
    std::string filepath = "";
    std::string url = value.toStdString();

    for(int index = 7; url[index] != '\0'; index++)
    {
        filepath += url[index];
    }
    return filepath;
}

void readFile::changeValue(QString value)
{
    std::fstream myfile;
    std::string filepath = "";

    filepath = getFileNamePath(value);

    myfile.open(filepath,std::ios::in);

    if(myfile.is_open())
    {
        std::string line;
        while(std::getline(myfile,line))
        {
            emit  valueChanged(line.c_str());
            emit  valueChanged("\n");
        }
        myfile.close();
    }
}

void readFile::updateValue(QString value, QString filename)
{
    std::fstream myfile;
    std::string filepath = "";

    filepath = getFileNamePath(filename);
    myfile.open(filepath,std::ios::out);
    if(myfile.is_open())
    {
        std::string content = value.toStdString();
        myfile<<content;
        myfile.close();
    }
}
