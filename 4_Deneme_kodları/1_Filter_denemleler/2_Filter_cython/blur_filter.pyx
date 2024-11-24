# blur_filter.pyx
cdef extern from "my_filter.h":
    void apply_blur(int width, int height, unsigned char *input, unsigned char *output)

def blur_image(int width, int height, unsigned char[:] input, unsigned char[:] output):
    apply_blur(width, height, &input[0], &output[0])
