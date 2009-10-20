#include "../nanotap.h"

int main() {
    ok(1, "ok");
    ok(0, "ng");
    diag("DIAG");
    note("NOTE");
    contains_string("yoyo", "ya", "not contains");
    contains_string("yoyo", "yo", "contains");
    done_testing();
    return 0;
}
