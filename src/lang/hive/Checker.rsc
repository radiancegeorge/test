module lang::hive::Checker

import lang::hive::Syntax;
import analysis::typepal::TypePal;

// Define custom types for type checking
data AType 
    = stringType()
    | intType()
    | tableType()
    ;

// Define roles for identifiers
data IdRole 
    = tableRole()
    | columnRole()
    ;

// Define pretty printing for custom types
str prettyAType(stringType()) = "STRING";
str prettyAType(intType()) = "INT";
str prettyAType(tableType()) = "TABLE";

void collect (current: (CreateTableProgram)`<CreateTableStatement tbSt>`, Collector c){
    collect(tbSt, c);
}

void collect (current: (CreateTableStatement)`CREATE TABLE <OptionalExist? cnd> <EId eId> ( <{ColumnDefinition ","}+ cDefs> ) <StorageOption stopt> ;`, Collector c){
    c.define("<eId>", tableRole(), current, defType(tableType()));
    c.enterScope(current);
        collect(cDefs, c);
    c.leaveScope(current);
}

void collect (current: (ColumnDefinition)`<Id id> <DataType dt>`, Collector c){
    c.define("<id>", columnRole(), current, defType(dt));
    collect(dt, c);
}



// data types
void collect (current: (DataType)`STRING`, Collector c){
    c.fact(current, stringType());
}

void collect (current: (DataType)`INT`, Collector c){
    c.fact(current, intType());
}



TModel LanguageTypeModel(Tree pt){
    return collectAndSolve(pt);
}