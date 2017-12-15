#pragma once

using namespace std;
#include <string>
#include <sstream>
#include <fstream>
#include <vector>
#define MAX 1200

struct Orldataset
{
	float col[400];
	string line;

};

class ORLData
{

public:
	

	ORLData();
	~ORLData();
	
	std::vector<Orldataset> receiveOrlData();
};

