<p align="center">
  <h1 align="center">CS1-PSW</h1>
</p>

> Make sure that the latest versions of `Node.js` and `Node Package Manager` are installed

To run
```bash
cd app && sh ../dependents.sh
node server # run server
```

> `app` directory is where the entire server is located
>
> `generation.sh` is the script I wrote that generated a boilerplate express server (ignore)
>
> `dependents.sh` is the dependencies required to run the application


[repl.it](https://www.replit.com/@Reference-Code/cs1-psw)

[code.org adaptation](https://www.ihaventgotthelink.yet)

<h1 align="center">Code Explanation</h1>


> File Tree
``` 
  app -|
      server.js
      reqs.json 
      package.json
      package-lock.json
      /views -|
              index.html
      /static -|
               index.css
               index.js
     /node_modules
```

`server.js` Utilizes Express and EJS to host a webserver and serve up an API

`reqs.json` Holds all of the requirements a user must make (served up as API)

`package.json` && `package-lock.json` Just for installing packages (@Express and @EJS)

`/views/index.html` The webpage served up by express and EJS. EJS looks for a `/views` folder to serve up content by default

`/static/index.css` && `/static/index.js` The express server hosts the entire static folder at the route `weburl.com/static/`, static folders typically hold non-changing content (browser javascript, css, or images)

`/node_modules` is a hefty directory. If you're installing packages manually ignore this, it contains all of the packages. Where as `package.json` catalogs them. This Directory holds all of their content (similair to Poetry with Python)
