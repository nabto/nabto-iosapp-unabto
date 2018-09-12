#include <unabto/unabto_common_main.h>
#include <unabto/unabto_app.h>
#include <modules/util/read_hex.h>

#include "select_impl.h"

bool start_unabto_app(const char* deviceid, const char* secret) {
    nabto_main_setup* nms = unabto_init_context();

    nms->id = strdup(deviceid);

    uint8_t psk[16] = { 0 };
    if (secret) {
        if (!unabto_read_psk_from_hex(secret, psk, 16)) {
            return false;
        }
    } else {
        memset(psk, 0, 16);
    }
    if (!unabto_set_aes_crypto(nms, psk, 16)) {
        return false;
    }
    
    return select_start(nms);
}

