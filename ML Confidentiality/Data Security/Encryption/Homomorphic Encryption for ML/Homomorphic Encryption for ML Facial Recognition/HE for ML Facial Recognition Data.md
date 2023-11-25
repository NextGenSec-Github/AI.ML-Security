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

### Homomorphic Encryption
   ```python
import tenseal as ts #pip install tenseal
from deepface import deepface #pip install deepface
import base64 #Allowing byte objects to stored in base64 
import math

# Load images
img1_path = "../deepface/tests/dataset/img1.jpg"
img2_path = "../deepface/tests/dataset/img2.jpg"

# Find embeddings
img1_embedding = DeepFace.represent(img1_path, model_name = 'Facenet')
img2_embedding = DeepFace.represent(img2_path, model_name = 'Facenet')

#Initialize the TenSEAL context and generate secret and public key pairs.
context = ts.context(ts.SCHEME_TYPE.CKKS, poly_modulus_degree=8192, coeff_mod_bit_sizes=[60, 40, 40, 60])

context.generate_galois_keys()
context.global_scale = 2 ** 40

# The secret key is serialized and stored in bytes securely using the serialize function.
secret_context = context.serialize(save_secret_key = True)
write_data(file_name = 'secret.txt', file_content = secret_context)

def write_data(file_name, file_content): 
   if type(file_content) == bytes:
      #bytes to base64
      file_content = base64.b64encode(file_content)
   
   with open(file_name, 'wb') as f:
      f.write(file_content)

def read_data(file_name):
   with open(file_name, 'rb') as f:
      file_content = f.read()
   return base64.b64decode(file_content)


context.make_context_public()
public_context = context.serialize()
write_data(file_name = 'public.txt', file_content = public_context)

del context, secret_context, public_context

#Encryption Time!
context = ts.context_from(read_data('secret.txt'))
enc_v1 = ts.ckks_vector(context, img1_embedding)
enc_v2 = ts.ckks_vector(context, img2_embedding)

write_data(file_name = 'enc_v1.txt', file_content = enc_v1.serialize())
write_data(file_name = 'enc_v2.txt', file_content = enc_v2.serialize())

del context, enc_v1, enc_v2

#Calculations
context = ts.context_from(read_data('public.txt'))
enc_v1 = ts.lazy_ckks_vector_from(read_data(file_name = 'enc_v1.txt'))
enc_v2 = ts.lazy_ckks_vector_from(read_data(file_name = 'enc_v2.txt'))

enc_v1.link_context(context)
enc_v2.link_context(context)

euclidean_squared = enc_v1 - enc_v2
euclidean_squared = euclidean_squared.dot(euclidean_squared)
write_data(file_name = 'euclidean_squared.txt', file_content = euclidean_squared.serialize())

euclidean_squared.decrypt()

del context, enc_v1, enc_v2, euclidean_squared

#Decryption
context = ts.context_from(read_data('secret.txt'))
euclidean_squared = ts.lazy_ckks_vector_from(read_data(file_name = 'euclidean_squared.txt'))
math.euclidean_squared.link_context(context)

euclidean_distance = math.sqrt(euclidean_squared.decrypt()[0])





   ```


























