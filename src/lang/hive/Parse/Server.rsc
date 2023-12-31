module lang::hive::Parse::Server

extend lang::hive::Checker;
extend analysis::typepal::TypePal;
import lang::hive::Syntax;
import ParseTree;
import util::Reflective;
import util::LanguageServer;
import Message;
import Prelude;
import IO;

// a minimal implementation of a DSL in rascal
// users can add support for more advanced features
set[LanguageService] testCont() = {
    parser(parser(#start[CreateTableProgram])),
    summarizer(testSummarizer, providesImplementations = false)
};

// normally you would import the typechecker and run it here
// for brevity we've inlined the implementation here
Summary testSummarizer(loc l, start[CreateTableProgram] input) {
    pt = parse(#start[CreateTableProgram], l).top;
//    println(input);
    TModel model = LanguageTypeModel(input); 
    // iprintToFile(|project://test/src/mod.yml|, model);
    definitions = model.definitions;
    Summary val =  summary(l,
        messages = {<message.at, message> | message <- model.messages},
        references = {<definition, definitions[definition].defined> | definition <- definitions}
    );
    println(val);
    return val;
}


public void main() {
  registerLanguage(
    language(
    pathConfig(srcs = [|std:///|, |project://test/src|]),
    "Hive Table", 
    "ql", 
    "lang::hive::Parse::Server",
    "testCont"
    ));
}