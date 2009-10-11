#include "../nanotap.h"

int main() {
    ok(1, "ok");
    ok(0, "ng");
    diag("hehe");
    string_contains("yoyo", "ya", "not contains");
    string_contains("yoyo", "yo", "contains");
    done_testing();
}
