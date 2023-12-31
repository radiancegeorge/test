module lang::hive::TM

import lang::entityLanguage::Adt;
import lang::hive::Adt;
import lang::entityLanguage::Parse::Adt;

public CreateTableProgram tModel (lang::entityLanguage::Adt::program(_, list[Entity] entities )){
    return lang::hive::Adt::program([tModel(e) | e <- entities]);
}

public CreateTableStatement tModel(entity(str id, list[Attribute] attrs)){
    StorageOption storeOption = storedAs(parquet());
    str optional = "IF NOT EXIST";
    return createTable(optional, id, [tModel(x) | x <- attrs], storeOption);
}

public ColumnDefinition tModel(Attribute a){
    switch(a){
        // case key(str id):
        //     return column(id, stringType());
        case propT1(str id, Type t):
            return column(id, getType(t));
        case propT2(str id, _):
            return column(id, stringType());
        default: return empty();
    }
}

public DataType getType(Type t){
    switch(t){
        case \str(): 
            return stringType();
        // case \bool(): 
        //     return stringType();
        case \int(): 
            return intType();
        default: throw "<t> not found!";
    }
}


public CreateTableProgram main (){
    x = tModel(lang::entityLanguage::Parse::Adt::main());
    return x;
}