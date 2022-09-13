#include "Poco/ByteOrder.h"
#include <iostream>

using Poco::ByteOrder;
using Poco::UInt16;

int main(int argc, char** argv)
{
	// Check the Endianness of your architecture
	#ifdef POCO_ARCH_LITTLE_ENDIAN
		std::cout << "Little Endian!" << std::endl;
	#else
		std::cout << "Big Endian!" << std::endl;
	#endif
	
	UInt16 port = 80;
	UInt16 networkPort = ByteOrder::toNetwork(port);
	
	return 0;		
}
