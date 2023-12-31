module lang::entityLanguage::Parse::Syntax

import IO;
import ParseTree;
import lang::entityLanguage::Syntax;

loc file = |project://test/src/lang/entityLanguage/eg/text.lang|;

public EntityProgram parseStr(loc x) = parse(#EntityProgram, x);

public EntityProgram main (loc x = file){
    Tree = parseStr(x);
    // println(Tree);
    return Tree;
}