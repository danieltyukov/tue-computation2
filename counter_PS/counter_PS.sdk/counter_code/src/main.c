/*
 * main.c
 *
 *  Created on: Mar 5, 2024
 *      Author: computation
 */

#include "custom_counter.h"
#include "xparameters.h"
#include "xil_io.h"

int main (void){

	CUSTOM_COUNTER_mWriteReg(XPAR_CUSTOM_COUNTER_0_S00_AXI_BASEADDR, CUSTOM_COUNTER_S00_AXI_SLV_REG1_OFFSET, 1); //reset
	CUSTOM_COUNTER_mWriteReg(XPAR_CUSTOM_COUNTER_0_S00_AXI_BASEADDR, CUSTOM_COUNTER_S00_AXI_SLV_REG1_OFFSET, 0); //reset
	CUSTOM_COUNTER_mWriteReg(XPAR_CUSTOM_COUNTER_0_S00_AXI_BASEADDR, CUSTOM_COUNTER_S00_AXI_SLV_REG0_OFFSET, 1); //enable
}
