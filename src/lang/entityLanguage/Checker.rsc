module lang::entityLanguage::Checker

import lang::entityLanguage::Syntax;
import analysis::typepal::TypePal;


data AType 
    = string()
    | entityType(str eName)
    ;

data IdRole 
    = attributeRole()
    | entityRole()
    ;


str prettyAType(string()) = "string";
str prettyAType(entityType(str eName)) = eName;
// str prettyAType() = "string";

void collect (current: (EntityProgram) `<Module m> <Entity+ entities>`, Collector c){
    collect(entities, c);
}

// void collect (current: (Module) `module <Id id>`, Collector c){

// }

void collect (current: (Entity) `entity <EId id> <Attribute+ attributes> end`, Collector c){
    c.define("<id>", entityRole(), current, defType(entityType("<id>")));
    c.enterScope(current);
        collect(attributes, c);
    c.leaveScope(current);
}

void collect (current: (Attribute) `key ( <Id id> )`, Collector c){
    c.use(id, {attributeRole()});
}
void collect (current: (Attribute) `<Id id> : <Type t>`, Collector c){
    c.define("<id>", attributeRole(), current, defType(string()));
}
void collect (current: (Attribute) `<Id id> -\> <TypeForeign t>`, Collector c){
    c.define("<id>", attributeRole(), current, defType(string()));
    collect(t, c);
}


// void collect (current: (Type) `String`, Collector c){
//     c.fact(current, string());
// }
// void collect (current: (Type) `Boolean`, Collector c){
//     c.fact(current, string());
// }
// void collect (current: (Type) `Integer`, Collector c){
//     c.fact(current, string());
// }

void collect (current: (TypeForeign) `List [ <EId entityId> ]`, Collector c){
    c.use(entityId, {entityRole()});
}

void collect (current: (TypeForeign) `<EId entityId>`, Collector c){
    c.use(entityId, {entityRole()});
}



TModel LanguageTypeModel(Tree pt){
    return collectAndSolve(pt);
}