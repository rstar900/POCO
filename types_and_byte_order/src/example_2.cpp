#include "Poco/Any.h"
#include "Poco/Exception.h"
#include <iostream>

using Poco::Any;
using Poco::AnyCast;
using Poco::RefAnyCast;

int main(int argc, char** argv)
{
	Any x(42);
	
	int int_x = AnyCast<int>(x); // Okay
	int& ref_x = RefAnyCast<int>(x); // Okay
	
	try
	{
		short short_x = AnyCast<short>(x); // BadCastException
	}
	catch(Poco::BadCastException&)
	{
		std::cout << "Poco::BadCastException occured!" << std::endl;
	}
	
	return 0;
}
