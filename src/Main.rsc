module Main

// import IO;
import lang::hive::TM;
import lang::hive::TS;

str main() {

    model = lang::hive::TM::main();
    src = lang::hive::TS::main(model);
    return src;
}
