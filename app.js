'use strict';

var AWS = require('aws-sdk');
AWS.config.update({region:'eu-west-1'});
var http = require('http');
var fs = require('fs');

var server = http.createServer(function(req, res){
    console.log('request was made to:  ' + req.url);

    if(req.url === '/home' || req.url === '/'){
        res.writeHead(200, {'Content-type': 'text/html'});
        fs.createReadStream(__dirname + '/index.html').pipe(res);
        

    } else if(req.url === '/kinesis'){
        res.writeHead(200, {'Content-type': 'text/html'});
        fs.createReadStream(__dirname + '/kinesis.html').pipe(res);
        //var rawrequest = toString(req.headers);
        var rawrequest = 'kinesis' + (JSON.stringify(req.headers));
        var currtime = Date.now().toString();
        _writeToKinesis(rawrequest, currtime);

    } else if(req.url === '/kafka'){
        res.writeHead(200, {'Content-type': 'text/html'});
        fs.createReadStream(__dirname + '/kafka.html').pipe(res);
        var rawrequest = 'kafka' + (JSON.stringify(req.headers));
        var currtime = Date.now().toString();
        _writeToKinesis(rawrequest, currtime);

    }
});

AWS.config.apiVersions = {
  kinesis: '2013-12-02',
  // other service API versions
};

var kinesis = new AWS.Kinesis();

function _writeToKinesis(rawrequest, currtime) {
var params = {
  Data: new Buffer.from(rawrequest),
  PartitionKey: currtime, 
  StreamName: 'nodejsdev'
};
console.log(params);

kinesis.putRecord(params, function(err, data) {
  if (err) console.log(err, err.stack); // an error occurred
  else     console.log(data);           // successful response
  //console.log(JSON.stringify(rawrequest));
});

}


server.listen(3000, '784f435de58f.ant.amazon.com');
console.log('NodeJS server listen on port 3000 until we kill it');



//         console.log(JSON.stringify(req.headers));
