#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xil_io.h" // Required for AXI GPIO
#include "coffee_moore.h"
#include "xparameters.h"
#include "sleep.h" // Required for usleep()

#define AXI_GPIO_BASEADDR XPAR_COFFEE_MOORE_0_S00_AXI_BASEADDR // Adjust this to your AXI GPIO base address
#define STATE_DISPLAY_OFFSET COFFEE_MOORE_S00_AXI_SLV_REG3_OFFSET // Adjust if necessary
#define COFFEE_OFFSET COFFEE_MOORE_S00_AXI_SLV_REG2_OFFSET // Adjust if necessary
#define INSERT_OFFSET COFFEE_MOORE_S00_AXI_SLV_REG1_OFFSET // Adjust if necessary
#define RESET_OFFSET COFFEE_MOORE_S00_AXI_SLV_REG0_OFFSET // Adjust if necessary
#define COINS_OFFSET COFFEE_MOORE_S00_AXI_SLV_REG1_OFFSET // Adjust if necessary

int main() {
    init_platform();

    u32 state_display, coffee, insert, reset, coins;

    while (1) {
        // Assuming the AXI GPIO is connected to the respective ports.
        // Adjust the offsets based on your AXI GPIO configuration.
        state_display = Xil_In32(AXI_GPIO_BASEADDR + STATE_DISPLAY_OFFSET);
        coffee = Xil_In32(AXI_GPIO_BASEADDR + COFFEE_OFFSET);
        insert = Xil_In32(AXI_GPIO_BASEADDR + INSERT_OFFSET);
        reset = Xil_In32(AXI_GPIO_BASEADDR + RESET_OFFSET);
        coins = Xil_In32(AXI_GPIO_BASEADDR + COINS_OFFSET);

        insert = (insert >> 2) & 1;
        coins &= 0b11;

        xil_printf("State: %d, Coffee: %d, Reset: %d, Insert: %d, Coins: %d\n\r",
                    state_display, coffee, reset, insert, coins);

        usleep(1000000); // Sleep for 1 second
    }

    cleanup_platform();
    return 0;
}

