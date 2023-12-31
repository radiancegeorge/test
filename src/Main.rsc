module Main

import IO;
import lang::hive::TM;
import lang::hive::TS;

str main() {

    model = lang::hive::TM::main();
    src = lang::hive::TS::main(model);

    writeFile(|project://test/src/lang/hive/eg/generated/text.ql|, src);

    return src;
}
