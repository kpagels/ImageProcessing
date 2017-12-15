#include "stdafx.h"
#include "ORLData.h"

ORLData::ORLData(){}
ORLData::~ORLData(){}


std::vector<Orldataset> ORLData::receiveOrlData() {
	std::vector<Orldataset> orlarray;
	int counter = 0;
	int index = 0;
	std::ifstream input("orl/orl_data.txt");
	std::string line;
	
	while (std::getline(input, line)) {
		counter++;
		Orldataset datatemp;
		datatemp.line = line;
		orlarray.push_back(datatemp);

	}
	for (int i = 0; i < MAX; i++) {
		std::istringstream iss(orlarray[i].line);
		for (std::string s; iss >> s; ) {
			orlarray[i].col[index] = strtof((s).c_str(), 0);
			index++;
		}

		index = 0;
	}
	return orlarray;
}

