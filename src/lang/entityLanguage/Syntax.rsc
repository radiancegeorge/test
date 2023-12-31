module lang::entityLanguage::Syntax

extend shared::Lexical;

start syntax EntityProgram
    = program: Module Entity+;

syntax Module 
    = \module: "module" Id;

syntax Entity 
    = entity: "entity" EId Attribute+ "end" ;

syntax Attribute 
    = key: "key" "(" Id ")" 
    | propT1: Id ":" Type
    | propT2: Id "-\>" TypeForeign 
    ; 

syntax Type 
    = \str: "String" 
    | \bool: "Boolean"
    | \int: "Integer"
    ;

syntax TypeForeign 
    = t1: "List" "[" EId "]" // one to many
    | t2: EId  
    ;