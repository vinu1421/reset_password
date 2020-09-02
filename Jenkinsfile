

properties([
    [$class: 'JiraProjectProperty'],
    
     parameters([
         string(defaultValue: '',
         description: 'Enter the username',
         name: 'Username',
         trim: false),
         choice(choices: ['pro', 'non-pro'],
         description: 'Select the environment',
         name: 'Environment')])
         
]) 

withCredentials([string(credentialsId: 'e7f6809c-29f3-4ca3-aea5-d799b9ad097d', variable: 'elk_user'),
string(credentialsId: 'ae07ae9f-e32e-4139-aa62-0023529b6899', variable: 'elk_pass')]) {
    // some block
}

def checkoutrepo() {

checkout([$class: 'GitSCM',
branches: [[name: '*/script']],
doGenerateSubmoduleConfigurations: false,
extensions: [], submoduleCfg: [],
userRemoteConfigs: [[credentialsId: '918483d2-a278-43f7-8618-1dc618466dfc',
url: 'https://github.com/vinu1421/reset_password.git']]
])



}


node() {



    stage('Build') {

        checkoutrepo()
        sh "chmod +x -R ${env.WORKSPACE}"    
        sh("""script/resetpass.sh""")


            

    

    }
}
