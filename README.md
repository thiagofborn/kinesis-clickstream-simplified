### simplified sample of Kinesis Click Stream
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
