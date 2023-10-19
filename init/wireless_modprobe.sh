#!/vendor/bin/sh
#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOG_TAG="wireless-modprobe"
MODULES_DIR="/vendor/lib/modules"
WLAN_MODULE=$(wireless_hwinfo driver_module)
WLAN_MODULE_ARGS=$(wireless_hwinfo driver_module_args)
BT_VENDOR=$(wireless_hwinfo vendor)
BT_SUPPORTED=$(wireless_hwinfo bluetooth_supported)

get_bluetooth_module_name() {
    case "${BT_VENDOR}" in
        broadcom)
            BT_MODULE="bcm_btlpm"
            ;;
        realtek)
            BT_MODULE="rtl_btlpm"
            ;;
        xradio)
            BT_MODULE="xradio_btlpm"
            ;;
        sprd)
            BT_MODULE="sprdbt_tty"
            ;;
    esac
}

load_module() {
    log -p i -t "${LOG_TAG}" "Loading module ${1} with args \"${2}\"."
    modprobe -a -d "${MODULES_DIR}" "${1}" "${2}"
}

load_wireless_module() {
    if [[ -z "${WLAN_MODULE}" ]]; then
        log -p e -t "${LOG_TAG}" "Couldn't detect WLAN module, skipping."
        return
    fi

    load_module "${WLAN_MODULE}" "${WLAN_MODULE_ARGS}"
}

load_bluetooth_module() {
    if [[ -z "${BT_MODULE}" ]]; then
        log -p e -t "${LOG_TAG}" "Couldn't detect Bluetooth module, skipping."
        return
    fi

    load_module "${BT_MODULE}"
}

load_wireless_module
if [ "${BT_SUPPORTED}" -eq "1" ]; then
    get_bluetooth_module_name
    load_bluetooth_module
    setprop vendor.init.modules.lpm_load 1
fi

setprop vendor.init.modules.load 1
