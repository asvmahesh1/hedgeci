#!/usr/bin/env groovy
// COOKBOOK BUILD SETTINGS

// name of this cookbook
def cookbook = 'ae-window-base'

// SUPERMARKET SETTINGS
// the branch that should be promoted to supermarket
def stableBranch = 'master'
// the current branch that is being built
def currentBranch = env.BRANCH_NAME

// OTHER (Unchanged)
// the checkout directory for the cookbook; usually not changed
def cookbookDirectory = "cookbooks/ae-windows-base-chef"


pipeline {
  agent any

 stages {
	stage ('Checkout') {
      steps {
	   
         echo "git checkout"
     checkout([$class: 'GitSCM', branches: [[name: '*/${branch}']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '9b611df4-f17d-445f-8f2b-d91ae6cb7436', url: 'https://github.com/aenetworks-infra/ae-sqlserver-chef.git']]])
	    }
	  }
    stage('Lint') {
      steps {
        parallel (
          rubocop: {
            sh 'echo "Starting chefstyle (rubocop): "'
			dir ('cookbooks/SqlServer/') {
            //sh '/opt/chefdk/embedded/bin/rubocop --fail-level E'
			  }
          },
          foodcritic: {
            sh 'echo "Starting foodcritic: "'
			dir ('cookbooks/SqlServer/') {
            //sh 'foodcritic . --tags ~FC003'
			}
          },
        )

        }
		post {
              always {
                // use checkstyle plugin to expose rubycop lint checks
                checkstyle canComputeNew: false, canRunOnFailed: true, defaultEncoding: '', failedTotalAll: '100', healthy: '', pattern: 'int-lint-results.xml', unHealthy: '', unstableTotalAll: '100'

				// use warnings plugin with our custom foodcritic parser to expose chef lint checks		 
				 warnings canComputeNew: false, canResolveRelativePaths: false, canRunOnFailed: true, categoriesPattern: '', consoleParsers: [[parserName: 'Foodcritic'], [parserName: 'Rubocop']], defaultEncoding: '', excludePattern: '', failedTotalAll: '0', healthy: '', includePattern: '', messagesPattern: '', unHealthy: '', unstableTotalAll: '0'

              }
            }
        }
    }
}

