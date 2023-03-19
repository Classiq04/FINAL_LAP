#!/usr/bin/env groovy

pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "us-east-1"
    }
    stages {
        stage("Creating an EKS Cluster") {
            steps {
                script {
                    dir('elastic-kubernetes-service') {
                        sh "terraform init"
                        sh "terraform apply --auto-approve"
                    }
                }
            }
        }
        stage("Deploying sock-shop-app microservice, webpage and a Monitoring system to EKS") {
            steps {
                script {
                    dir('kubernetes') {
           		sh "aws eks --region us-east-1 update-kubeconfig --name deployment-cluster"
                        sh "kubectl create -f sock-shop-app/"
                        sh "kubectl create -f monitoring-stack/"
                        sh "kubectl create -f alerting-stack/"
                    }
                }
            }
        }
    }
}
