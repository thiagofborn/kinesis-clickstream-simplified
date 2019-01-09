<<<<<<< HEAD
## Simplified sample of Kinesis Click Stream
=======
## simplified sample of Kinesis Click Stream
>>>>>>> 4a490defda661dc411b48b1554418f81f39629a6
I have wrote this sample for a presentation training, so don't expect much about it. 
Basically, it is a nodejs application that launches a http server with a hosts a web page that has two links.
The links triggers an API call to Kinesis Data Stream (putRecord request), and used as data blob the raw HTTP requested parsed into a JSON file as the blob data.
So, case you click the link "Click Streaming to Kinesis Data Stream" it will tag the request as "Kinesis" parse the raw http request and ship it to a Kinesis Data stream.
Same concept to "Click Kafka Data Stream", but instead of Kinesis it will tag as Kafka.

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

### Launch the Application
Run the app you will have everything that is happening on the ouput. 
This is nice to explain what is happening to your audience. 
```shell
node app.js
```
### AWS Lambda as a consumer
```python
"""
You can find this source on the AWS Lambda blueprint
I have added some extra but I commented. 
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