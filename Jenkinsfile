
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


node() {



    stage('Build') {
    
    List user = "${Username}".split(',')
    for (int i = 0; i < user.size(); i++) {
        sh "echo Reseting password for ${user[i]}"
        password1 = sh (script: 'mkpasswd -l 12',returnStdout: true).trim()
        if (params.Environment == 'pro') {
            httpRequest acceptType: 'APPLICATION_JSON', authentication: 'ed0e0046-e19d-4fe3-be02-94103ee9b978', consoleLogResponseBody: true, contentType: 'APPLICATION_JSON', httpMode: 'POST', ignoreSslErrors: true, requestBody: '{"password": "' + password1 + '"}', responseHandle: 'NONE', url: 'http://192.168.56.102:9200/_security/user/'+ user[i] +'/_password', useSystemProperties: true, validResponseCodes: '200', wrapAsMultipart: false
            echo "the password is : ${password1}"
        } else {

            echo "sorry"
        }
    }
   
    
    
      

   
            

    

    }
}
