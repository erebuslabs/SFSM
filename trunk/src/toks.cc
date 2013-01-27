#include "defs.h"
#include "toks.h"
using namespace std;

toks::toks():myType(0),myUid(0),myTerm(""){}
toks::toks(string term):myType(0),myUid(0),myTerm(term){}
toks::toks(string term, tokentypes type):myType(type),myUid(0),myTerm(term){}
toks::toks(int myID, string term, tokentypes type):myType(type),myUid(myID),myTerm(term){}

toks::~toks(){}

bool toks::setType(tokentypes type){
  assert (type >=  0 && type < 16);
  myType = type;
  return true;
}
bool toks::setTerm(string Term){
  myTerm = Term;
  return true;
}
bool toks::setToken(string Term, tokentypes type){
  assert (type >=  0 && type < 16);
  myTerm = Term;
  myType = type;
  return true;
}

bool toks::setToken(int idnum, string Term, tokentypes type){

  assert (idnum >=0 && idnum <16777216);
  myUid = idnum;
  assert (type >=  0 && type < 16);    
  myType = type;
  myTerm = Term;

  return true;
}
  
int toks::getTypeN(){
  return myType;
}

string toks::getTerm(){
  return myTerm;
}
int toks::getUid(){
  return myUid;
  }

string toks::getTypeS(){
  const char* const literal_toks[] = { \
    "undef", "TERM", "AND", "OR", "NOT", "XOR", "TSTART", "TEND", "CEND", "eof"};
  return  literal_toks[myType];
}
