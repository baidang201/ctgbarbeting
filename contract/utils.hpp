#ifndef __UTILS_HPP__
#define __UTILS_HPP__

#include <string>
#include <vector>
#include <functional>
#include <iostream>

using namespace std;

void split(const string& s, char c,
           vector<string>& v) {
   string::size_type i = 0;
   string::size_type j = s.find(c);

   while (j != string::npos) {
      v.push_back(s.substr(i, j-i));
      i = ++j;
      j = s.find(c, j);

      if (j == string::npos)
         v.push_back(s.substr(i, s.length()));
   }
} 

/**
 * Clear completely a EOS table (`multi_index`) from all its data.
 */
template <uint64_t TableName, typename T, typename... Indices>
void clear(eosio::multi_index<TableName, T, Indices...>& table) {
  auto itr = table.begin();
  while (itr != table.end()) {
    itr = table.erase(itr);
  }
}

#endif
