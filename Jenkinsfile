@Library('fpga-ci-lib@v0.1.0') _
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

