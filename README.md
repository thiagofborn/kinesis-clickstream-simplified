## Simplified sample of Kinesis Click Stream

I have written this sample for presentation training, so don't expect much about it. 
It is a nodejs application that launches an HTTP server with a host a web page that has two links.
The links trigger an API call to Kinesis Data Stream (putRecord request), and used as data blob the raw HTTP requested parsed into a JSON file as the blob data.
So, case you click the link "Click Streaming to Kinesis Data Stream," it will tag the request as "Kinesis" parse the raw HTTP request and ship it to a Kinesis Datastream.
The same concept to "Click Kafka Data Stream," but instead of Kinesis, it will tag as Kafka.

One AWS lambda function can be create to be the consumer. The AWS Lambda Blueprints has one easy blueprint to follow.
It was enough to demonstrate the concepts.

### The web page
![Sample Web Page](https://github.com/thiagofborn/kinesis-clickstream-simplified/blob/master/images/samplepage.png "Sample Web Page")

### Prerequisites
- Create a Kinesis Data Stream
- Install nodejs (The version I have used v11.1.0)
- Clone the repository 
- Install the AWS nodejs SDK 
- Launch the Application
- Launch a lambda on your AWS account to check what is happening

### Installing nodejs
To install quicly on OSX check the reference as follows: 
```
https://www.dyclassroom.com/howto-mac/how-to-install-nodejs-and-npm-on-mac-using-homebrew
```

### Clone the repository
```shell
git clone https://github.com/thiagofborn/kinesis-clickstream-simplified.git 
```

### Installing AWS nodejs SDK
```shell
npm i aws-sdk
```

### Update your /etc/hosts with local IP entry
At my local environment, I have the entry matching the string "**myip**." So, I wrote a shell to query my local IP address and update the listing on my /etc/hosts. Please note the script was written based on Mac OSX Sierra - 10.12.6. 
```
10.222.108.64 myip 784f435de58f.ant.com
```

### Launching the Application
Run the app using the command below. You will be able to see all the output on your screen. 
We can use this to explain the whole process to your audience: restful APIs, the interaction between your app and AWS, etc.
```shell
node app.js
```

### AWS Lambda as a consumer
The lambda consumer will be triggered by the *Lambda Poller*. In short, the *Lambda Poller* passed the object directly to your lambda function. 
In this case, it is simplified.
```python
"""
You can find this source on the AWS Lambda blueprint
I have added some extra but it is commented here. 
"""
from __future__ import print_function

import base64
import json

print('Loading function')


def lambda_handler(event, context):
    #print("Received event: " + json.dumps(event, indent=2))
    for record in event['Records']:
        # Kinesis data is base64 encoded so decode here
        payload = base64.b64decode(record['kinesis']['data'])
        print("Decoded payload: " + payload)
    return 'Successfully processed {} records.'.format(len(event['Records']))

```
