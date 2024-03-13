const path = require('path'); // get directory path
const express = require('express'); // the BEST library for Node.js web servers
const ejs = require('ejs'); // a templating engine for node.js

const app = express(); // instatiating the express app

app.use(express.urlencoded({ extended: true })); // url encoding things for express
app.use('/static/', express.static('./static')); // serving up the /static directory for my static files 
app.engine('html', ejs.renderFile);  // telling ejs to render html files not .ejs by default

app.get('/', (req, res) =>{
  res.render('./index.html'); // serving up the index.html file
});

app.get('/api', (req, res) =>{
  res.header("Content-Type",'application/json'); // setting the header to return a JSON respones, so that json isn't rendered in html
  const __dirname = path.resolve(); // getting the current directorys path (similair to bash: pwd)
  res.sendFile(path.join(__dirname, `reqs.json`)); // serving up the reqs.json file
});

app.listen(8080, () => { // start server on port 8080
  console.log('[SUCCESS] SERVER RUNNING AT 127.0.0.1:8080');
});
/* ^^ server ^^ */