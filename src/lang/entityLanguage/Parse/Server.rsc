module lang::entityLanguage::Parse::Server

extend lang::entityLanguage::Checker;
extend analysis::typepal::TypePal;
import lang::entityLanguage::Syntax;
import ParseTree;
import util::Reflective;
import util::LanguageServer;
import Message;
import Prelude;
import IO;

// a minimal implementation of a DSL in rascal
// users can add support for more advanced features
set[LanguageService] testCont() = {
    parser(parser(#start[EntityProgram])),
    summarizer(testSummarizer, providesImplementations = false)
};

// normally you would import the typechecker and run it here
// for brevity we've inlined the implementation here
Summary testSummarizer(loc l, start[EntityProgram] input) {
    pt = parse(#start[EntityProgram], l).top;
//    println(input);
    TModel model = LanguageTypeModel(input); 
//     // iprintToFile(|project://rascal-yaml/src/resources/mod.yml|, model);
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
    "Entity Language", 
    "lang", 
    "lang::entityLanguage::Parse::Server",
    "testCont"
    ));
}