module shared::Lexical

extend lang::std::Layout;

lexical Id = [a-z_]+;

lexical EId = [A-Z][a-z0-9]+;