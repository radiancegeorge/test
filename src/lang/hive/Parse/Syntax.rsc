module lang::hive::Parse::Syntax

import IO;
import ParseTree;
import lang::hive::Syntax;

loc file = |project://test/src/lang/hive/eg/h.ql|;

public CreateTableProgram parseStr(loc x) = parse(#CreateTableProgram, x);

public CreateTableProgram main (loc x = file){
    Tree = parseStr(x);
    // println(Tree);
    return Tree;
}