#ifndef NANOTAP_H_
#define NANOTAP_H_

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

static int TEST_COUNT = 0;

/**
 * This simply evaluates any expression ("$got eq $expected" is just a
 * simple example) and uses that to determine if the test succeeded or
 * failed.  A true expression passes, a false one fails.  Very simple.
 */
static void ok(int x, const char *msg) {
    printf("%s %d - %s\n", (x ? "ok" : "not ok"), ++TEST_COUNT, msg ? msg : "");
}

/**
 * display diagnostics message.
 */
static void diag(const char *msg) {
    fprintf(stderr, "# %s\n", msg ? msg : "");
}

/**
 * contains_string() searches for $substring in $string.
 */
static void contains_string(const char *string, const char *substring, const char *msg) {
    ok(strstr(string, substring) != NULL, msg);
}

/**
 *  If you don’t know how many tests you’re going to run, you can issue
 * the plan when you’re done running tests.
 */
static void done_testing() {
    printf("1..%d\n", TEST_COUNT);
    exit(0);
}

#ifdef __cplusplus
// you can use more convinient stuff if you are using c++.

#include <string>
#include <iostream>

/**
 * shorthand for std::string
 */
static void diag(const std::string &msg) {
    diag(msg.c_str());
}

/**
 * flexible is() based on C++ template.
 */
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

/**
 * shorthand for lazy person
 */
static void ok(int x) {
    ok(x, "");
}

/**
 * shorthand for std::string
 */
static void contains_string(const std::string &str, const char *substr, const char *msg) {
    contains_string(str.c_str(), substr, msg);
}
#endif

#endif /* NANOTAP_H_ */
