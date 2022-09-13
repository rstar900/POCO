#include "Poco/DynamicAny.h"
#include "Poco/Exception.h"
#include <iostream>

using Poco::DynamicAny;

int main(int argc, char** argv)
{
	DynamicAny any(42);
	
	// Automatic conversion
	int i = any;
	
	// Convert to std::string
	std::string st(any.convert<std::string>());
	
	// Still a doubt in this part
	any.convert(st);
	
	// extract a reference to int
	const int& any_ref(any.extract<int>());
	
	// This should work
	short s = any;
	
	//Bad Cast Exception
	try
	{
		short s = any.extract<short>();
	}
	catch(Poco::BadCastException&)
	{
		std::cout << "Poco::BadCastException occured" << std::endl;
	}
	
	return 0;
}
