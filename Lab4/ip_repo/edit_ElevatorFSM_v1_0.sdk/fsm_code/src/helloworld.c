#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xil_io.h" // Required for AXI GPIO
#include "ElevatorFSM.h"
#include "xparameters.h"
#include "sleep.h" // Required for usleep()

#define AXI_GPIO_BASEADDR XPAR_ELEVATORFSM_0_S00_AXI_BASEADDR // Adjust this to your AXI GPIO base address
#define UPDATE_OFFSET ELEVATORFSM_S00_AXI_SLV_REG3_OFFSET // Adjust if necessary
#define MOVEMENT_OFFSET ELEVATORFSM_S00_AXI_SLV_REG2_OFFSET // Adjust if necessary
#define FLOOR_OFFSET ELEVATORFSM_S00_AXI_SLV_REG1_OFFSET // Adjust if necessary
#define MOTOR_CONTROL_OFFSET ELEVATORFSM_S00_AXI_SLV_REG0_OFFSET // Adjust if necessary
#define RESET_OFFSET ELEVATORFSM_S00_AXI_SLV_REG3_OFFSET // Adjust if necessary

int main() {
    init_platform();

    u32 movement, floor, update, reset, motor_control;

    while (1) {
        // Assuming the AXI GPIO is connected to the respective ports.
        // Adjust the offsets based on your AXI GPIO configuration.
    	motor_control = Xil_In32(AXI_GPIO_BASEADDR + MOTOR_CONTROL_OFFSET);
    	floor = Xil_In32(AXI_GPIO_BASEADDR + FLOOR_OFFSET);
        update = Xil_In32(AXI_GPIO_BASEADDR + UPDATE_OFFSET);
        reset = Xil_In32(AXI_GPIO_BASEADDR + RESET_OFFSET);
        movement = Xil_In32(AXI_GPIO_BASEADDR + MOVEMENT_OFFSET);

        update = (update >> 1) & 1;
        reset &= 0b1;


//        Bitwise Shifting and Masking for insert: The insert signal is extracted by shifting the register value two bits to the right (insert >> 2) and then masking it with 1 (& 1). This process isolates a single bit (the third bit from the right) from the register, effectively reading a boolean value that indicates whether a coin has been inserted.
//
//        Bitwise Masking for coins: The coins value is obtained by applying a bitwise AND operation (& 0b11) to the register value. This operation masks all but the two least significant bits of the register, which represent the number of coins inserted into the system.

        xil_printf("Floor: %d, Movement: %d, Reset: %d, Update: %d, Motor_Control: %d\n\r",
        		floor, movement, reset, update, motor_control);

        usleep(1000000); // Sleep for 1 second
    }

    cleanup_platform();
    return 0;
}

