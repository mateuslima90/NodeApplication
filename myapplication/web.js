
const cluster = require('cluster');
const http = require('http');
const numCPUs = require('os').cpus().length;

if (cluster.isMaster) {
  console.log(`Master ${process.pid} is running`);

  //Fork Workers
   for (let i = 0; i <numCPUs; i++) {
	cluster.fork();
   }

   cluster.on('exit', (worker,code, signal) => {
	console.log(`worker ${worker.process.pid} died`);
	});
}else {

var express = require('express');
var app = express();

app.get('/', function (req, res){
res.send('Hello World!');
});

app.listen(3000,function() {
console.log('Example app listening on port 3000!')
console.log('example')
});

  console.log(`Worker ${process.pid} started`);
}
