
properties([
    [$class: 'JiraProjectProperty'],
    
     parameters([
         string(defaultValue: '',
         description: 'Enter the username. supports comma seperation eg: username1,username2',
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
        echo "Reseting password for ${user[i]}"
        //password1 = sh (script: 'mkpasswd -l 12',returnStdout: true).trim()
        def allChars = [ 'A'..'Z', 'a'..'z', '0'..'9' ].flatten() - [ 'O', '0', 'l', '1', 'I' ]
        def password1 = ""
        def generatePassword = { length ->
        (0..<length).collect { password1 = password1 + allChars[ new Random().nextInt( allChars.size() ) ] }
         }  
        generatePassword(15) 
        if (params.Environment == 'pro') {
           httpRequest acceptType: 'APPLICATION_JSON', authentication: 'ed0e0046-e19d-4fe3-be02-94103ee9b978', consoleLogResponseBody: true, contentType: 'APPLICATION_JSON', httpMode: 'POST', ignoreSslErrors: true, requestBody: '{"password": "' + password1 + '"}', responseHandle: 'NONE', url: 'http://192.168.56.102:9200/_security/user/'+ user[i] +'/_password', useSystemProperties: true, validResponseCodes: '200', wrapAsMultipart: false
           echo "Reset success for user ${user[i]}, The new password is : ${password1}"
        } else {

            echo "sorry"
        }
    }
   
    
    
      

   
            

    

    }
}
