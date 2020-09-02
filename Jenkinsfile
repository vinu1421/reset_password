

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

    def response = httpRequest authentication: 'ed0e0046-e19d-4fe3-be02-94103ee9b978', contentType: 'APPLICATION_JSON', httpMode: 'POST', url: "http://192.168.56.102:9200/_security/user/A1451371/_password?passwor=vi1421"
    println('Status: '+response.status)

            

    

    }
}
