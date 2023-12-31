module lang::hive::Adt

import lang::hive::Syntax;

data CreateTableProgram
    = program(list[CreateTableStatement] statements)
    ;

data CreateTableStatement
    = createTable(str optional, str tableName, list[ColumnDefinition] columns, StorageOption storageOption)
    ;

data ColumnDefinition
    = column(str name, DataType dataType)
    ;

data DataType
    = stringType()
    | intType()
    | floatType()
    ;

data StorageOption
    = storedAs(StorageType storageType)
    ;

data StorageType
    = parquet()
    ;
