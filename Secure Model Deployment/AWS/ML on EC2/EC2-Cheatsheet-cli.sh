#!/bin/bash

# Amazon EC2 for Machine Learning CLI Cheatsheet

# ==============================================================================
# Instance Management Commands
# ==============================================================================

# Launch a new EC2 instance for machine learning
aws ec2 run-instances --image-id <image_id> --instance-type <instance_type> --key-name <key_name> --security-group-ids <security_group_id> --subnet-id <subnet_id> --iam-instance-profile Name=<iam_role_name> --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=<instance_name>}]'

# List running EC2 instances
aws ec2 describe-instances --filters "Name=instance-state-name,Values=running"

# Stop a running EC2 instance
aws ec2 stop-instances --instance-ids <instance_id>

# Start a stopped EC2 instance
aws ec2 start-instances --instance-ids <instance_id>

# ==============================================================================
# Data Preprocessing and Model Training Commands
# ==============================================================================

# Upload data to an EC2 instance
aws s3 cp <local_file_path> <s3://bucket_name/>

# Download data from an S3 bucket to an EC2 instance
aws s3 cp <s3://bucket_name/<file_path> <local_destination_path>

# Install necessary libraries and tools on the EC2 instance
ssh -i <key.pem> ec2-user@<instance_public_ip> "<install_command>"

# Run data preprocessing scripts on the EC2 instance
ssh -i <key.pem> ec2-user@<instance_public_ip> "<preprocessing_script>"

# Train a machine learning model on the EC2 instance
ssh -i <key.pem> ec2-user@<instance_public_ip> "<train_script>"

# ==============================================================================
# Model Deployment and Inference Commands
# ==============================================================================

# Deploy a trained model on the EC2 instance
ssh -i <key.pem> ec2-user@<instance_public_ip> "<deployment_script>"

# Perform inference using the deployed model on the EC2 instance
ssh -i <key.pem> ec2-user@<instance_public_ip> "<inference_script>"

# ==============================================================================
# Monitoring and Logging Commands
# ==============================================================================

# Retrieve CPU utilization metrics for a specific EC2 instance
aws cloudwatch get-metric-statistics --namespace AWS/EC2 --metric-name CPUUtilization --dimensions Name=InstanceId,Value=<instance_id> --start-time <start_time> --end-time <end_time> --period <period> --statistics Average

# Retrieve memory utilization metrics for a specific EC2 instance
aws cloudwatch get-metric-statistics --namespace System/Linux --metric-name MemoryUtilization --dimensions Name=InstanceId,Value=<instance_id> --start-time <start_time> --end-time <end_time> --period <period> --statistics Average

# Stream logs from a running EC2 instance
aws logs tail --follow --log-group-name <log_group_name> --filter-pattern <filter_pattern>

# ==============================================================================

# ==============================================================================
# Automation and Scaling Commands
# ==============================================================================

# Configure auto scaling for EC2 instances based on machine learning workload
aws autoscaling put-scaling-policy --auto-scaling-group-name <auto_scaling_group_name> --policy-name <policy_name> --scaling-adjustment <scaling_adjustment> --adjustment-type <adjustment_type>

# Set up CloudWatch alarms for EC2 instance metrics
aws cloudwatch put-metric-alarm --alarm-name <alarm_name> --alarm-description <alarm_description> --metric-name <metric_name> --namespace <namespace> --statistic <statistic> --dimensions Name=<dimension_name>,Value=<dimension_value> --period <period> --threshold <threshold> --comparison-operator <comparison_operator> --evaluation-periods <evaluation_periods> --alarm-actions <alarm_actions>

# Configure AWS Lambda functions to trigger actions based on EC2 instance events
aws lambda create-function --function-name <function_name> --runtime <runtime> --role <role_arn> --handler <handler_function> --code <code_location>

# Configure AWS Step Functions to orchestrate machine learning workflows on EC2 instances
aws stepfunctions create-state-machine --name <state_machine_name> --definition <state_machine_definition> --role-arn <role_arn>

# ==============================================================================

# ==============================================================================
# Security and Access Control Commands
# ==============================================================================

# Manage security groups to control inbound and outbound traffic to EC2 instances
aws ec2 authorize-security-group-ingress --group-id <group_id> --protocol <protocol> --port <port> --cidr <cidr>
aws ec2 revoke-security-group-ingress --group-id <group_id> --protocol <protocol> --port <port> --cidr <cidr>

# Configure IAM roles and policies for EC2 instances to access other AWS services
aws iam create-role --role-name <role_name> --assume-role-policy-document <policy_document>
aws iam attach-role-policy --role-name <role_name> --policy-arn <policy_arn>

# Configure encryption for data at rest on EC2 instances using AWS Key Management Service (KMS)
aws kms create-key --description <key_description>
aws kms encrypt --key-id <key_id> --plaintext <plaintext_data>

# ==============================================================================
# Cost Management Commands
# ==============================================================================

# Analyze EC2 instance usage and costs using AWS Cost Explorer
aws ce get-cost-and-usage --time-period <time_period> --granularity <granularity> --metrics <metrics> --group-by <group_by>

# Retrieve EC2 instance pricing information for different instance types and regions
aws pricing get-products --service-code AmazonEC2 --filters Type=TERM_MATCH,Field=instanceType,Value=<instance_type>



