#ifndef NANOTAP_H_
#define NANOTAP_H_

#include <stdio.h>
#include <string.h>

static int TEST_COUNT = 0;

static void ok(int x, const char *msg) {
    printf("%s %d - %s\n", (x ? "ok" : "not ok"), ++TEST_COUNT, msg ? msg : "");
}

static void diag(const char *msg) {
    fprintf(stderr, "# %s\n", msg ? msg : "");
}

static void string_contains(const char *got, const char *expected, const char *msg) {
    ok(strstr(got, expected) != NULL, msg);
}

static void done_testing() {
    printf("1..%d\n", TEST_COUNT);
}

#ifdef __cplusplus
// you can use more convinient stuff if you are using c++.

#include <string>
#include <iostream>
static void diag(const std::string &msg) {
    diag(msg.c_str());
}

template <class T>
static void is(T got, T expected, const char *msg) {
    if (got == expected) {
        ok(true, msg);
    } else {
        ok(false, msg);
        std::cout << "  # got      : " << got << std::endl;
        std::cout << "  # expected : " << expected << std::endl;
    }
}

static void ok(int x) {
    ok(x, "");
}

static void string_contains(const std::string &got, const char *expected, const char *msg) {
    string_contains(got.c_str(), expected, msg);
}
#endif

#endif /* NANOTAP_H_ */
