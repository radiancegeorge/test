module lang::entityLanguage::Parse::Adt


// import IO;
import ParseTree;
import lang::entityLanguage::Adt;
import lang::entityLanguage::Parse::Syntax;


public EntityProgram main (){
    ast = implode(#EntityProgram, lang::entityLanguage::Parse::Syntax::main());
    // println(ast);

    return ast;
}