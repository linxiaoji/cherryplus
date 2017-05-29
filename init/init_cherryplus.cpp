/*
   Copyright (c) 2017, The Lineage OS Project
   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.
   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <fstream>
#include <string>

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
#include "util.h"

#include "init_hi6210sft.h"

void init_target_properties()
{
    char platform[PROP_VALUE_MAX];
    std::ifstream fin;
    std::string buf;
    int rc;

    rc = property_get("ro.board.platform", platform);
    if (!rc || strncmp(platform, "hi6210sft", PROP_VALUE_MAX))
        return;

    fin.open("/sys/firmware/devicetree/base/hisi,product_name");
    while (getline(fin, buf))
        if ((buf.find("CHERRY_PLUS_ED00") != std::string::npos) || (buf.find("CHERRY_PLUS_TL00") != std::string::npos) || (buf.find("CHERRY_PLUS_UL00") != std::string::npos))
            break;
    fin.close();

    if (buf.find("CHERRY_PLUS_TL00") != std::string::npos) {
        property_set("ro.product.model", "Che2-TL00");	
    }
    else if (buf.find("CHERRY_PLUS_UL00") != std::string::npos) {
        property_set("ro.product.model", "Che2-UL00");
    }
    else if (buf.find("CHERRY_PLUS_ED00") != std::string::npos) {
        property_set("ro.product.device", "hwChe2");
        property_set("ro.product.model", "Che2-L11");
        property_set("ro.product.name", "Che2-L11");
    }
    else {
	property_set("ro.product.model", "hi6210sft");
    }
}
