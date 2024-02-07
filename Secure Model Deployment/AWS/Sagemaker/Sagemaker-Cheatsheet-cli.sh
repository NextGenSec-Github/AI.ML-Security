# Amazon SageMaker CLI Cheatsheet

# ==============================================================================
# General Commands
# ==============================================================================

# List SageMaker notebooks
aws sagemaker list-notebook-instances

# Describe a specific SageMaker notebook
aws sagemaker describe-notebook-instance --notebook-instance-name <instance_name>

# Create a new SageMaker notebook
aws sagemaker create-notebook-instance --notebook-instance-name <instance_name> --instance-type <instance_type> --role-arn <role_arn>

# Delete a SageMaker notebook
aws sagemaker delete-notebook-instance --notebook-instance-name <instance_name>

# Start a stopped SageMaker notebook
aws sagemaker start-notebook-instance --notebook-instance-name <instance_name>

# Stop a running SageMaker notebook
aws sagemaker stop-notebook-instance --notebook-instance-name <instance_name>

# Update a SageMaker notebook's instance type
aws sagemaker update-notebook-instance --notebook-instance-name <instance_name> --instance-type <new_instance_type>

# ==============================================================================
# Model Building Commands
# ==============================================================================

# List SageMaker training jobs
aws sagemaker list-training-jobs

# Describe a specific SageMaker training job
aws sagemaker describe-training-job --training-job-name <job_name>

# Start a SageMaker training job
aws sagemaker create-training-job --training-job-name <job_name> --algorithm-specification <algorithm_spec> --input-data-config <input_data_config> --output-data-config <output_data_config> --resource-config <resource_config> --stopping-condition <stopping_condition> --role-arn <role_arn>

# Stop a running SageMaker training job
aws sagemaker stop-training-job --training-job-name <job_name>

# List SageMaker model packages
aws sagemaker list-model-packages

# Describe a specific SageMaker model package
aws sagemaker describe-model-package --model-package-name <package_name>

# ==============================================================================
# Model Deployment Commands
# ==============================================================================

# List SageMaker endpoints
aws sagemaker list-endpoints

# Describe a specific SageMaker endpoint
aws sagemaker describe-endpoint --endpoint-name <endpoint_name>

# Create a SageMaker endpoint
aws sagemaker create-endpoint --endpoint-name <endpoint_name> --endpoint-config-name <config_name>

# Delete a SageMaker endpoint
aws sagemaker delete-endpoint --endpoint-name <endpoint_name>

# Update a SageMaker endpoint configuration
aws sagemaker update-endpoint --endpoint-name <endpoint_name> --endpoint-config-name <new_config_name>

# ==============================================================================
# Data Management Commands
# ==============================================================================

# List SageMaker data sources
aws sagemaker list-data-sources

# Describe a specific SageMaker data source
aws sagemaker describe-data-source --data-source-arn <data_source_arn>

# Create a SageMaker data source
aws sagemaker create-data-source --data-source-name <data_source_name> --data-source-type <data_source_type> --data-spec <data_spec>

# Delete a SageMaker data source
aws sagemaker delete-data-source --data-source-arn <data_source_arn>

# Update a SageMaker data source
aws sagemaker update-data-source --data-source-arn <data_source_arn> --data-source-name <new_data_source_name> --data-spec <new_data_spec>
