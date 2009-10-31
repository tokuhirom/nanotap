#include "../nanotap.h"

int main() {
    is_binary("O", "OK", "length");
    is_binary("OP", "OK", "2 byte");
    is_binary("OK", "OK", "success");

    done_testing();
}
