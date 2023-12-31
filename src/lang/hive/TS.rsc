module lang::hive::TS

import List;
import lang::hive::Adt;
import lang::hive::Parse::Adt;

public str toHive(program(list[CreateTableStatement] st)){
    return "<intercalate("\n", ["<toHive(x)>" | x <- st])>";
}

public str toHive(createTable(str opt, str tn, list[ColumnDefinition] dfs, StorageOption stOpt)){
    return "CREATE TABLE <opt> <tn> (\n\t<intercalate(",\n\t", ["<toHive(x)>" | x <- dfs])> \n) \n<toHive(stOpt)>";
}


public str toHive(column(str x, DataType dt)){
    return "<x> <toHive(dt)>";
}

public str toHive (DataType dt){
    switch(dt){
        case stringType(): return "STRING"; 
        case intType(): return "INT"; 
        default: throw "<dt> not defined!";
    }
}

public str toHive(storedAs(StorageType x)){
    return "STORED AS <toHive(x)>";
}

public str toHive(parquet()){
    return "PARQUET";
}

public str main (){
    ast = lang::hive::Parse::Adt::main();
    src = toHive(ast);
    return src;
}