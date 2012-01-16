/*
 * Copyright (C) 2008 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <stdlib.h>
#include <errno.h>
#include <fcntl.h>


#include <netinet/in.h>
#include <arpa/inet.h>

#define LOG_TAG "UsbController"
#include <cutils/log.h>
#include <cutils/properties.h>
#include <string.h>

#include "UsbController.h"

#define MAX_USB_PRODUCT_ID_SIZE	10

#define USB_QCOM_RNDIS_ID_STRING "1364"
#define USB_QCOM_ADB_ID_STRING   "1351"
#define USB_QCOM_UMS_ID_STRING   "1353"


UsbController::UsbController() {
}


UsbController::~UsbController() {
}


int UsbController::startRNDIS() {
	LOGD("Usb RNDIS start");

	return enableRNDIS(true);
}


int UsbController::stopRNDIS() {
	LOGD("Usb RNDIS stop");

	return enableRNDIS(false);
}


int UsbController::enableRNDIS(bool enable) {
	char value[MAX_USB_PRODUCT_ID_SIZE];

	int fd = open("/sys/module/g_android/parameters/product_id", O_RDWR);
	int count = snprintf(value, sizeof(value), "%s\n", (enable ? USB_QCOM_RNDIS_ID_STRING : USB_QCOM_ADB_ID_STRING));
	write(fd, value, count);
	close(fd);

	return 0;
}


bool UsbController::isRNDISStarted() {
	char value[MAX_USB_PRODUCT_ID_SIZE];

	int fd = open("/sys/module/g_android/parameters/product_id", O_RDONLY);
	read(fd, &value, sizeof(value));
	close(fd);

	return(!strncmp(value, USB_QCOM_RNDIS_ID_STRING, sizeof(USB_QCOM_RNDIS_ID_STRING)) ? true : false);
}

