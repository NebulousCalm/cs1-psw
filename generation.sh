if [ -f "./app/server.js" ]; then
  echo "[ERROR] Detected a server already in ./app, now overwriting."
  rm -rf ./app
fi 
mkdir app
cd app
npm init -y
mkdir views
cd views
touch index.html
echo "<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Boilerplate</title>
    <script src="https://kit.fontawesome.com/48e723b064.js" crossorigin="anonymous"></script>
    <script defer src="/static/index.js"></script>
    <link rel="stylesheet" href="/static/index.css" />
</head>
<body>
<span id="follow"></span>
</body>
</html>" > index.html
cd ../
mkdir static
cd static 
touch index.css
echo "@import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Nunito+Sans:ital,opsz,wght@0,6..12,200;0,6..12,300;0,6..12,400;0,6..12,500;0,6..12,600;0,6..12,700;0,6..12,800;0,6..12,900;0,6..12,1000;1,6..12,200;1,6..12,300;1,6..12,400;1,6..12,500;1,6..12,600;1,6..12,700;1,6..12,800;1,6..12,900;1,6..12,1000&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');@import url('https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,100;0,9..40,200;0,9..40,300;0,9..40,400;0,9..40,500;0,9..40,600;0,9..40,700;0,9..40,800;0,9..40,900;0,9..40,1000;1,9..40,100;1,9..40,200;1,9..40,300;1,9..40,400;1,9..40,500;1,9..40,600;1,9..40,700;1,9..40,800;1,9..40,900;1,9..40,1000&family=Inter:wght@100;200;300;400;500;600;700;800;900&family=Pixelify+Sans:wght@400;500;600;700&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Sometype+Mono:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700&display=swap');@import url('https://fonts.googleapis.com/css2?family=Anta&family=Kode+Mono:wght@400..700&family=Nunito:ital,wght@0,200..1000;1,200..1000&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');*{margin: 0;padding: 0;font-family: 'DM Sans', sans-serif;}:root{--bg-gray: #111821;--main-red: #8E3943;--tan: #E4D6A7;--off-gray: #8390A5;--light-gray: #D5DBDB;}body{background-color: #000;overflow-x: hidden;height: 100vh;}#follow{width: 20px;height: 20px;background-color: #fff;border-radius: 50%;position: fixed;left: 0;top: 0;z-index: 10000000;pointer-events: none;opacity: 0;transition: opacity 500ms ease, width 500ms, height 500ms;}body:hover > #follow {opacity: 1;}" > index.css
touch index.js
echo 'const trailer=document.getElementById("follow");window.onmousemove=t=>{const e={transform:`translate(${t.clientX-trailer.offsetWidth/2}px, ${t.clientY-trailer.offsetWidth/2}px)`};trailer.animate(e,{duration:800,fill:"forwards"})};' > index.js
cd ../
mkdir modules
touch server.js
echo "[SUCCESS] Wrote server file, now adding files"

echo "
const express = require('express');
const ejs = require('ejs');
const app = express();
app.use(express.urlencoded({ extended: true }));
app.use('/static/', express.static('./static'));
app.engine('html', ejs.renderFile);
app.get('/', (req, res) =>{
  res.render('./index.html');
});
app.listen(8080, () => {
  console.log('Server running on port 8080');
});
" > server.js
npm install express
npm install ejs
node server