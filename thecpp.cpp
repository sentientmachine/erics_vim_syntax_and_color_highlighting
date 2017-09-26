#include <vector>
#include <iostream>
#include <string>
using namespace std;
int main() {
    int age = 20*5;
    vector <int> myints = {3, 55, 2, -1, 7, 8}; 
    if ( age < 100 ) { 
      cout<<"You are pretty young!\n";
    }   
    else if ( false ) { 
      cout<<"You are old";
    }   
    else {
      cout<<"You are \u2713 really old";
    }   
    string s = ""; 
    for(int i : myints){
      s += to_string(i);
    }   
    /*  
    * block comment
    */
    cout << s;      //prints 355278
    string j = "asdf";
    char foobar[100] = "blags";
    char* ptr = foobar;
    const char *moobar = "aliens";                                                                                             
}
template <typename T,unsigned S> inline unsigned arraysize(const T (&v)[S]) { return S; }
string example_function(double a, char b){ 
    cout << "k";
    switch(0x35 >> 3){ 
        case 1:
            return "yeah";
            break;
        default:
            return "nope";
            break;
        }
    return to_string(598);
}
