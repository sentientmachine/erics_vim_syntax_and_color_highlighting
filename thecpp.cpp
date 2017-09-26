#include <vector>
#include <iostream>
#include <string>
using namespace std;

int main() {
    vector <int> myints = {3, 55, 2, -1, 7, 8};
  
    string s = "";
    for(int i : myints){
        s += to_string(i);
    }
    cout << s;      //prints 355278
}
