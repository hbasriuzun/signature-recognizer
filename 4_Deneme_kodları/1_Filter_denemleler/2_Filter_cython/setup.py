from setuptools import setup, Extension
from Cython.Build import cythonize
import numpy as np

extensions = [
    Extension(
        "my_filter",
        ["my_filter.pyx"],
        include_dirs=[np.get_include()],
    )
]

setup(
    name="my_filter",
    ext_modules=cythonize(extensions),
)

