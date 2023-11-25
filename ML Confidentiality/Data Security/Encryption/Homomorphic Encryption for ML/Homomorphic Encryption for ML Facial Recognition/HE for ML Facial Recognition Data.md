# Fully Homomorphic Encrypted Facial Recognition with TenSEAL in Python

## Introduction

In this project, we explore homomorphic facial recognition using TenSEAL and the deep face libraries in Python. Homomorphic encryption enables calculations on encrypted data, allowing us to perform facial recognition on encrypted facial embeddings stored in a cloud system.

This project is designed for educational purposes and demonstrates the concept of homomorphic encryption applied to facial embeddings. While the code is functional, it is not intended for production use. It is recommended to thoroughly read through the code and understand the underlying principles of homomorphic encryption before attempting to modify or use it for other purposes.

Note: This project uses specific versions of the tenseal and deepface libraries, and library APIs may change over time. Ensure that you have the correct versions installed.

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
import tenseal as ts # Import the tenseal library for homomorphic encryption
from deepface import deepface # Import the DeepFace library for face recognition
import base64 # Import the base64 library for encoding/decoding binary data
import math # Import the math library for mathematical operations
# Load images
img1_path = "../deepface/tests/dataset/img1.jpg"
img2_path = "../deepface/tests/dataset/img2.jpg"

# Find embeddings
img_embeddings = DeepFace.verify(img1_path, img2_path, model_name = 'Facenet')
img1_embedding = img_embeddings['verified']
img2_embedding = img_embeddings['verified']

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


context.make_context_public() # Make the context public by removing the secret key
public_context = context.serialize()

# Write the serialized public key to a file
write_data(file_name = 'public.txt', file_content = public_context)

del context, secret_context, public_context # Delete sensitive information

#Encryption Time!
context = ts.context_from(read_data('secret.txt'))
enc_v1 = ts.ckks_vector(context, img1_embedding) # Encrypt the first image's embeddings
enc_v2 = ts.ckks_vector(context, img2_embedding) # Encrypt the second image's embeddings

write_data(file_name = 'enc_v1.txt', file_content = enc_v1.serialize()) # Write the serialized encrypted vector to a file
write_data(file_name = 'enc_v2.txt', file_content = enc_v2.serialize()) # Write the serialized encrypted vector to a file

del context, enc_v1, enc_v2 # Delete sensitive information

#Calculations
context = ts.context_from(read_data('public.txt')) # Load the public key context from the file
enc_v1 = ts.lazy_ckks_vector_from(read_data(file_name = 'enc_v1.txt'))
enc_v2 = ts.lazy_ckks_vector_from(read_data(file_name = 'enc_v2.txt'))

# Link the vector to the public key context
enc_v1.link_context(context)  context
enc_v2.link_context(context)

euclidean_squared = enc_v1 - enc_v2 # Perform operations on the encrypted vectors
euclidean_squared = euclidean_squared.dot(euclidean_squared) # Compute the dot product of the vectors
write_data(file_name = 'euclidean_squared.txt', file_content = euclidean_squared.serialize()) # Write the result to a file

euclidean_squared.decrypt() # Decrypt the result

del context, enc_v1, enc_v2, euclidean_squared # Delete sensitive information

#Decryption
context = ts.context_from(read_data('secret.txt')) # Load the secret key context from the file
euclidean_squared = ts.lazy_ckks_vector_from(read_data(file_name = 'euclidean_squared.txt'))  # Load the encrypted result
math.euclidean_squared.link_context(context) # Link the vector to the secret key context

euclidean_distance = math.sqrt(euclidean_squared.decrypt()[0])  # Decrypt the result and compute the square root
   ```


























