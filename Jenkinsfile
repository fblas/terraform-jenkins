pipeline {
    agent any
    options {
                timestamps ()
            }

    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
       // choice(name: 'action', choices: ['apply', 'destroy'], description: 'Select the action to perform')
    }

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws_secret_access_key')
        AWS_DEFAULT_REGION    = 'us-east-1'
    }
  
    stages {
        
        stage('Checkout') {
            steps {
             script{
                    dir("terraform")
                        {
                           git branch: 'main', url: 'https://github.com/cristhiancaldas/terraform-jenkins.git'
                        }
                    }
            }
        }

        stage('Terraform init') {
            steps { 
                 sh 'pwd;cd terraform ; terraform init -input=false'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'pwd;cd terraform ; terraform plan -out tfplan'
                sh 'pwd;cd terraform ; terraform show -no-color tfplan > tfplan.txt'
                
            }
        }
        stage('Approval') {
           when {
               not {
                   equals expected: true, actual: params.autoApprove
               }
           }

           steps {
               script {
                    def plan = readFile 'terraform/tfplan.txt'
                    input message: "Do you want to apply the plan?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
               }
           }
       }

        stage('Apply') {
            steps {
                    sh "pwd;cd terraform ; terraform apply -input=false tfplan"
            }
        }

    }
}