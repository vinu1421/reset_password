

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

withCredentials([usernamePassword(credentialsId: '79bf41e9-bc79-4f76-9247-3e7a7af5ead9',
passwordVariable: 'elk_pass', usernameVariable: 'elk_user')]) {
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
