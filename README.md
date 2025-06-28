# AWS CodePipeline for Java Docker Application

This repository contains a simple Java application with a Dockerfile and build specification to demonstrate a CI/CD pipeline using **AWS CodePipeline** and **AWS CodeBuild**.

## Overview

The pipeline automates the following steps:

1. **Source:** Pulls the latest code from the GitHub repository.
2. **Build:** Uses AWS CodeBuild to compile the Java app, build a Docker image, and push the image to Amazon Elastic Container Registry (ECR).
3. **Deploy:** (Optional) You can configure an ECS Fargate service to deploy the Docker image automatically.

## Project Structure

'''
bash
my-java-app/
├── src/
│ └── Hello.java # Simple Java app entry point
├── Dockerfile # Defines how to build the Docker image
├── buildspec.yml # CodeBuild specification for building and pushing the Docker image
└── README.md # This file


## Prerequisites

- AWS account with permissions for CodePipeline, CodeBuild, ECR, and optionally ECS.
- GitHub repository connected via AWS CodeStar GitHub App.
- Amazon ECR repository created for storing Docker images.
- (Optional) ECS Fargate cluster and service for deployment.

## Environment Variables for CodeBuild

Set these environment variables in your CodeBuild project configuration:

- `REPOSITORY_URI` — Your ECR repository URI (e.g., `123456789012.dkr.ecr.us-east-1.amazonaws.com/my-java-app`)
- `AWS_REGION` — The AWS region of your resources (e.g., `us-east-1`)

## How It Works

- When you push changes to the configured GitHub branch (e.g., `main` or `master`), CodePipeline triggers.
- CodeBuild pulls the source code, compiles the Java application, builds the Docker image, tags it with `latest`, and pushes it to ECR.
- If you have configured a deploy stage (e.g., ECS Fargate), the updated image is deployed automatically.

## Usage

1. Push code changes to your GitHub repository.
2. AWS CodePipeline automatically starts the build and deploy process.
3. Monitor pipeline progress via AWS Console under CodePipeline.
4. (Optional) Verify your application running in ECS or other target environment.

## Customize

- Modify `buildspec.yml` to customize build steps, tests, or image tagging.
- Adjust the Dockerfile as needed to change your app’s containerization.
- Add deployment stages in CodePipeline for ECS, Lambda, or other targets.

## Troubleshooting

- Check the AWS CodeBuild logs for build failures.
- Verify GitHub connection permissions and webhook configuration.
- Confirm environment variables are set correctly in CodeBuild.
