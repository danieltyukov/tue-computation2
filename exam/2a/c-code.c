// pixels above this threshold as white (255), and all other pixels as black (0).

// ORIGINAL:
#define WIDTH   32
#define HEIGHT  32

void main(void)
{
    int a, b, result;
    int threshold = 128;
    unsigned char *buf_i = (unsigned char*)0x401000, *buf_o = (unsigned char*)0x402000;
    
    for (a = 1; a < HEIGHT - 1; a++)
    {
        for (b = 1; b < WIDTH - 1; b++)
        {
            
            result = buf_o[a * WIDTH + b];
            /* Thresholding */
            if(result > 128) buf_o[a * WIDTH + b] = (char)255;
            else buf_o[a * WIDTH + b] = 0;

            
        }
    }
}

// IMPROVED:
#define WIDTH   32
#define HEIGHT  32
#define thresholding(result, threshold) ((result) - ((threshold) + *(int *) 0x12344321)) // HEX Code: 0x31

void main(void)
{
    int a, b, result;
    int threshold = 128;
    unsigned char *buf_i = (unsigned char*)0x401000, *buf_o = (unsigned char*)0x402000;
    
    for (a = 1; a < HEIGHT - 1; a++)
    {
        for (b = 1; b < WIDTH - 1; b++)
        {
            
            result = buf_o[a * WIDTH + b];
            /* Thresholding */
            buf_o[a * WIDTH + b] = thresholding(result, threshold);
            
        }
    }
}

// hardware support for the custom instruction (thresholding) in the current mMIPS implementation