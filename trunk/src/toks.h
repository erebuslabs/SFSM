/* 
 * toks.h
 * Copyright (C) 2013 Mike Borowczak
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.

 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * ======================================================================
 * Contributor(s)
 * M Borowczak <borowczak@gmail.com>
 *
 */

#ifndef TOKS_H
#define TOKS_H

#include "defs.h"
using namespace std;


class toks{
 private:
  unsigned myType :  4; // TERM or OP: AND, OR, XOR, NOT  (with possibility to expand)
  unsigned myUid  : 24; // UniqueID  
  string myTerm;
  
 public:
  toks();
  toks(string);
  toks(string, tokentypes);
  toks(int, string, tokentypes);
  ~toks();
  bool setToken(string, tokentypes);
  bool setToken(int, string, tokentypes);
  
  bool setType(tokentypes); //redundant
  bool setTerm(string); //reduntant
  bool setUid(int); //redundan

  int getTypeN();
  string getTypeS();
  string getTerm();
  int getUid();

};

#endif /* TOKS_H */
