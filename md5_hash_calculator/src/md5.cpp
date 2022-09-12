#include "Poco/MD5Engine.h"
#include "Poco/DigestStream.h"

#include <iostream>

int main()
{
	Poco::MD5Engine md5;
	Poco::DigestOutputStream ds(md5);
	std::string inputString;
	
	std::cout << "Enter a string: ";
	std::cin >> inputString; 
	ds << inputString;
	ds.close();
	
	std::cout << "md5 checksum : " << Poco::DigestEngine::digestToHex(md5.digest()) << std::endl;
	return 0;
}
