# Fully Homomorphic Encrypted Facial Recognition with TenSEAL in Python

## Introduction

In this project, we explore homomorphic facial recognition using TenSEAL and the deep face libraries in Python. Homomorphic encryption enables calculations on encrypted data, allowing us to perform facial recognition on encrypted facial embeddings stored in a cloud system.

## Requirements

To run this project, you need to install two main requirements:

**TenSEAL**: Install using `pip install tenseal` or an alias `ts` using `pip install tenseal as ts`.

   ```bash
   pip install tenseal
   ```
### Install DeepFace Library:
   ```bash
   pip install deepface
   ```

### Deep Face Library: Import this requirement from deepface.
  ```python
   from deepface import deepface
  ```

### Facial Embeddings
To find facial embeddings, we use the deepface library's represent function. Example:
   ```python
import tenseal as ts #pip install tenseal
from deepface import deepface #pip install deepface

# Load images
img1_path = "../deepface/tests/dataset/img1.jpg"
img2_path = "../deepface/tests/dataset/img2.jpg"

# Find embeddings
img1_embeddings = DeepFace.represent(img1_path, model_name = 'Facenet')
img2_embeddings = DeepFace.represent(img2_path, model_name = 'Facenet')

#Initialize the TenSEAL context and generate secret and public key pairs.
context = ts.context(ts.SCHEME_TYPE.CKKS, poly_modulus_degree=8192, coeff_mod_bit_sizes=[60, 40, 40, 60])

context.generate_galois_keys()
context.global_scale = 2 ** 40

context.serialize(save_secret_key = True)
   ```


























