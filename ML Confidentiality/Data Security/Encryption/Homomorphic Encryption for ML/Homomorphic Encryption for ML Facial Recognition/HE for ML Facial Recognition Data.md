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
from deepface import deepface

# Load images
image1_path = "dataset/image1.jpg"
image2_path = "dataset/image2.jpg"

# Find embeddings
embedding1 = deepface.represent(image1_path, model_name="FaceNet")
embedding2 = deepface.represent(image2_path, model_name="FaceNet")
   ```



