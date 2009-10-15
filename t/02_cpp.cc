#include "../nanotap.h"

int main() {
    ok(1, "ok");
    ok(0, "ng");
    diag("DIAG");
    note("NOTE");
    contains_string("yoyo", "ya", "not contains");
    contains_string("yoyo", "yo", "contains");
    
    // C++ specific
    is(1, 1, "good");
    is(1, 0, "bad");
    is(std::string("OK"), std::string("OK"), "good");
    is(std::string("NG"), std::string("OK"), "bad");
    is(std::string("NG"), std::string("OK"), "bad");
    is(std::string("OK"), "OK", "good");
    is("OK", std::string("OK"), "good");
    is("OK", std::string("OK"));
    ok(1);
    contains_string(std::string("YOaaa"), "aaa", "ok");

    done_testing();
}
