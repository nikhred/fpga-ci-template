@Library('fpga-ci-lib@main') _
pipeline {
  agent none
  stages {
    stage('Pipeline') {
      steps {
        script {
          def cfg = readYaml(file: 'ci/config.yaml')
          fpgaPipeline(cfg)
        }
      }
    }
  }
}

