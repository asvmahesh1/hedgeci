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

// Everything below should not change unless you have a good reason :slightly_smiling_face:
def building_pull_request = env.pullRequestId != null

def notify_stash(building_pull_request){
  if(building_pull_request){
    step([$class: 'StashNotifier',
      commitSha1: "${env.sourceCommitHash}"])
  }
}

def execute(command){
  ansiColor('xterm'){
    bat command
  }
}

def rake(command) {
  execute("chef exec rake -t ${command}")
}

def fetch(scm, cookbookDirectory, currentBranch){
  checkout([$class: 'GitSCM',
    branches: scm.branches,
    doGenerateSubmoduleConfigurations: scm.doGenerateSubmoduleConfigurations,
    extensions: scm.extensions + [
      [$class: 'RelativeTargetDirectory',relativeTargetDir: cookbookDirectory],
      [$class: 'CleanBeforeCheckout'],
      [$class: 'LocalBranch', localBranch: currentBranch]
    ],
    userRemoteConfigs: scm.userRemoteConfigs
  ])
}

stage('Lint') {
  node('windows') {
    notify_stash(building_pull_request)

    echo "cookbook: ${cookbook}"
    echo "current branch: ${currentBranch}"
    echo "checkout directory: ${cookbookDirectory}"
    try{
      fetch(scm, cookbookDirectory, currentBranch)
      dir(cookbookDirectory){
        // clean out any old artifacts from the cookbook directory including the berksfile.lock file
        rake('clean')
      }

     dir(cookbookDirectory) {
        try {
          rake('style')
        }
        finally {
          step([$class: 'CheckStylePublisher',
                canComputeNew: false,
                defaultEncoding: '',
                healthy: '',
                pattern: '**/reports/xml/checkstyle-result.xml',
                unHealthy: ''])
        }
      }
      currentBuild.result = 'SUCCESS'
    }
    catch(err){
      currentBuild.result = 'FAILED'
      notify_stash(building_pull_request)
      throw err
    }
  }
}

stage('Unit Test'){
  node('windows') {
    try {
      fetch(scm, cookbookDirectory, currentBranch)
      dir(cookbookDirectory) {
        rake('test:berks_install')
        rake('test:unit')
        currentBuild.result = 'SUCCESS'
      }
    }
    catch(err){
      currentBuild.result = 'FAILED'
      notify_stash(building_pull_request)
      throw err
    }
    finally {
      junit allowEmptyResults: true, testResults: '**/rspec.xml'
    }
  }
}

stage('Functional (Kitchen)') {
  node('kitchen') {
    try{
      fetch(scm, cookbookDirectory, currentBranch)
      dir(cookbookDirectory) {
        rake('test:kitchen:all')
      }
      currentBuild.result = 'SUCCESS'
    }
    catch(err){
      currentBuild.result = 'FAILED'
    }
    finally {
      notify_stash(building_pull_request)
      dir(cookbookDirectory) {
        rake('test:kitchen:destroy')
      }
    }
  }
}

if (currentBranch == stableBranch){
  lock(cookbook){
    stage ('Promote to Supermarket') {
      node('kitchen'){
        fetch(scm, cookbookDirectory, currentBranch)
        dir(cookbookDirectory) {
          execute "git branch --set-upstream ${currentBranch} origin/${currentBranch}"
          rake('release')
        }
      }
    }
  }
}