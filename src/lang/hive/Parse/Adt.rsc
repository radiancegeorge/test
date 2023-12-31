module lang::hive::Parse::Adt


// import IO;
import ParseTree;
import lang::hive::Adt;
import lang::hive::Parse::Syntax;

public CreateTableProgram main (){
    ast = implode(#CreateTableProgram, lang::hive::Parse::Syntax::main());
    // println(ast);

    return ast;
}