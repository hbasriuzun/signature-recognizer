# Numpy modülünü içe aktarma
import numpy as np

# C işlevini tanımlamak için gerekli başlık dosyasını içe aktarıyoruz
cdef extern from "my_filter.h":
    void apply_blur(int width, int height, unsigned char *input, unsigned char *output, int blur_level)

# Python tarafından çağrılabilir bir sarıcı fonksiyon tanımlıyoruz
def apply_blur_wrapper(int width, int height, input, int blur_level):
    cdef unsigned char[:] input_view = input  # NumPy dizisi ile çalışmak için bir görünüm oluşturuyoruz
    cdef unsigned char[:] output_view = np.zeros_like(input_view)  # Çıktı dizisi

    # C fonksiyonunu çağırıyoruz
    apply_blur(width, height, &input_view[0], &output_view[0], blur_level)

    # Çıktıyı yeniden yapılandırıp geri döndürüyoruz
    return np.array(output_view).reshape(height, width)
