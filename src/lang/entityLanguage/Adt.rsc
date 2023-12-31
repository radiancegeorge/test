module lang::entityLanguage::Adt

import lang::entityLanguage::Syntax;

data EntityProgram
    = program(Module \module, list[Entity] entities)
    ;

data Module
    = \module(str name)
    ;

data Entity
    = entity(str id, list[Attribute] attributes)
    ;

data Attribute
    = key(str id)
    | propT1(str id, Type \type1)
    | propT2(str id, TypeForeign \type2)
    ;

data Type 
    = \str()
    | \bool()
    | \int()
    ;

data TypeForeign 
    = t1(str eName)
    | t2(str eName)
    ;

