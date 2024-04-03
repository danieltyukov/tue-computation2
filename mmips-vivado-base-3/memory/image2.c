#define WIDTH   32
#define HEIGHT  32
#define max_int 255
#define sfu0(a, b) ((a) - ((b) + *(int *) 0x12344321))

void main(void)
{
    int a, b, result;
	unsigned int max = 255;
	int var;
    char *buf_i = (char*)0x401000, *buf_o = (char*)0x402000;
    
    for (a = 1; a < HEIGHT - 1; a++)
    {
        for (b = 1; b < WIDTH - 1; b++)
        {
				int aminus = a - 1;
				int aplus  = a + 1;
				int bminus = b - 1;
				int bplus = b - 1;

				result = ((
				

					-7 * (int)buf_i[(aminus) * WIDTH + bminus] +
					5 * (int)buf_i[(aminus) * WIDTH + b] +
					2 * (int)buf_i[(aminus) * WIDTH + bplus] +
					-1 * (int)buf_i[a      * WIDTH + bminus] +
					15 * (int)buf_i[a      * WIDTH + b] +
					-1 * (int)buf_i[a      * WIDTH + bplus] +
					2 * (int)buf_i[(aplus) * WIDTH + bminus] +
					5 * (int)buf_i[(aplus) * WIDTH + b] +
					-7 * (int)buf_i[(aplus) * WIDTH + bplus] +
					128) / 13);

                         /*-7*(int)buf_i[(a - 1) * WIDTH + b - 1] +
                          5*(int)buf_i[(a - 1) * WIDTH + b    ] +
                          2*(int)buf_i[(a - 1) * WIDTH + b + 1] +
                         -1*(int)buf_i[ a      * WIDTH + b - 1] +
                         15*(int)buf_i[ a      * WIDTH + b    ] +
                         -1*(int)buf_i[ a      * WIDTH + b + 1] +
                          2*(int)buf_i[(a + 1) * WIDTH + b - 1] +
                          5*(int)buf_i[(a + 1) * WIDTH + b    ] +
                         -7*(int)buf_i[(a + 1) * WIDTH + b + 1] +
                        128) / 13);*/

			var = sfu0(result, max_int);
            /* Clipping */
            //if(result<0) buf_o[a * WIDTH + b] = 0;
            //else if (result > 255) buf_o[a * WIDTH + b] = (char)255;
            //else buf_o[a * WIDTH + b] = result;
        }
    }
}
