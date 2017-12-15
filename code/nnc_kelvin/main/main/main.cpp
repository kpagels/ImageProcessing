// main.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <vector>
#include <iostream>
#include <iterator>
#include <sstream>
#include <fstream>
#include "ORLData.h"

int main()
{
	ORLData orltemp;
	std::vector<Orldataset> orlArray = orltemp.receiveOrlData();

    return 0;
}

