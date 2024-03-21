#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xil_io.h"
#include "sleep.h"

#define AXI_GPIO_BASEADDR 0x40000000 // Adjust to your AXI GPIO base address
// Offsets need to match those in your hardware design
#define STATE_DISPLAY_OFFSET 0x0
#define COFFEE_OFFSET 0x4
#define INSERT_OFFSET 0x8
#define RESET_OFFSET 0xC
#define COINS_OFFSET 0x10

int main() {
    init_platform();

    u32 state_display, coffee, insert, reset, coins;

    while (1) {
        // Read from the AXI GPIO and mask the irrelevant bits
        state_display = Xil_In32(AXI_GPIO_BASEADDR + STATE_DISPLAY_OFFSET) & 0x00000007; // Assuming 3 bits for state_display
        coffee = Xil_In32(AXI_GPIO_BASEADDR + COFFEE_OFFSET) & 0x00000001; // Assuming 1 bit for coffee
        insert = Xil_In32(AXI_GPIO_BASEADDR + INSERT_OFFSET) & 0x00000001; // Assuming 1 bit for insert
        reset = Xil_In32(AXI_GPIO_BASEADDR + RESET_OFFSET) & 0x00000001; // Assuming 1 bit for reset
        coins = Xil_In32(AXI_GPIO_BASEADDR + COINS_OFFSET) & 0x00000003; // Assuming 2 bits for coins

        xil_printf("State: %d, Coffee: %d, Reset: %d, Insert: %d, Coins: %d\n\r",
                    state_display, coffee, reset, insert, coins);

        usleep(1000000); // Sleep for 1 second
    }

    cleanup_platform();
    return 0;
}
