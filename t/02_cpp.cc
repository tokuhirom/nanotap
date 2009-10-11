#include "../nanotap.h"

int main() {
    ok(1, "ok");
    ok(0, "ng");
    diag("hehe");
    string_contains("yoyo", "ya", "not contains");
    string_contains("yoyo", "yo", "contains");
    
    // C++ specific
    is(1, 1, "good");
    is(1, 0, "bad");
    is(std::string("OK"), std::string("OK"), "good");
    is(std::string("NG"), std::string("OK"), "bad");
    is(std::string("NG"), std::string("OK"), "bad");
    ok(1);
    string_contains(std::string("YOaaa"), "aaa", "ok");

    done_testing();
}
