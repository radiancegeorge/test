module lang::hive::Syntax

extend shared::Lexical;

start syntax CreateTableProgram
    = program: CreateTableStatement+;

syntax CreateTableStatement 
    = createTable: "CREATE TABLE" OptionalExist? EId "(" {ColumnDefinition ","}+ ")" StorageOption ";" 
    ;

syntax OptionalExist
    = "IF NOT EXISTS"
    ;

syntax ColumnDefinition 
    = column: Id DataType
    | empty: 
    ;

syntax DataType 
    = stringType: "STRING" 
    | intType: "INT"
    ;

syntax StorageOption 
    = storedAs: "STORED AS" StorageType;

syntax StorageType
    = parquet: "PARQUET"
    ;


