# Access Control For SageMaker Studio Notebooks 🛡️🔒

Amazon SageMaker Studio utilizes filesystem and container permissions for access control and isolation of Studio users and notebooks. This document explores how permissions are configured to mitigate security threats, default settings in SageMaker Studio, and customization options available to users.

## 1. SageMaker App Permissions

- **Run-As User for JupyterServer App**: By default, the JupyterServer app runs as the `sagemaker-user` (UID 1000), with sudo permissions for installing dependencies.
  
- **Run-As User for KernelGateway Apps**: KernelGateway apps run as `root` (UID 0) by default, enabling installation of dependencies using pip/apt-get/conda.

## 2. User Remapping

SageMaker utilizes user remapping to map container users to non-privileged users on the host instance. This ensures that users inside the container cannot access host resources.

- **User Remapping Example**: `sagemaker-user` (UID 1000) inside the container might map to `user` (UID 200001) on the instance, preventing privileged access.

## 3. Custom Image Permissions

Users can bring custom SageMaker images, specifying different run-as user/groups for launching KernelGateway apps. Fine-grained permission control can be implemented inside the image, such as disabling root access.

- **User Remapping in Custom Images**: Same user remapping applies, ensuring non-privileged access regardless of user/group IDs set in the custom image.

## 4. Container Isolation

- **Default Docker Capabilities**: SageMaker Studio doesn’t add additional capabilities to Docker containers. Specific route rules block requests to Amazon EFS and the instance metadata service (IMDS) from the container.

- **Route Rules Limitations**: Customers cannot alter these route rules from within the container, enhancing security by restricting access to sensitive services.

## 5. App Metadata Access

Metadata used by running apps are mounted to the container with read-only permissions, preventing modification from the container. This ensures the integrity and security of app metadata.

## 6. User Isolation on EFS

SageMaker creates an Amazon EFS volume for each Studio domain, shared among all Studio users. Each user has a private home directory on the EFS volume, with a globally unique user ID applied as a POSIX user/group ID for access control.

## 7. EBS Access

- **Amazon EBS Volume**: Attached to the host instance and shared across all images, storing temporary data generated inside the container.

- **Root User Limitations**: The root user inside the container cannot access the EBS volume, enhancing security by preventing unauthorized access to persistent storage.

## 8. IMDS Access

Access to the Amazon EC2 Instance Metadata Service (IMDS) is unavailable in SageMaker Studio due to security concerns. This prevents potential security threats leveraging IMDS access.
