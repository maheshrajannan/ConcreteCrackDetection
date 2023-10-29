// we will use here 2 libraries which is express & multer
const express = require('express');
const multer = require('multer');

// Multer is a middlewar, which is primarily used for uploading files
var storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, __dirname + '/uploads/images')
  },
  filename: function (req, file, cb) {
    cb(null, file.originalname) //Appending .jpg
  }
})

var upload = multer({ storage: storage }).single('photo');
// const upload = multer({dest: __dirname + '/uploads/images'}).single('photo');

const app = express();
const PORT = 3000;
// It will use the 3000 port to upload images

app.use(express.static('public'));

app.post("/upload", (req, res) => {
   upload(req, res, (err) => {
    if(err) {
      res.status(400).send("Something went wrong!");
    }
    res.send(req.file);
  });
});
app.listen(PORT, () => {
    console.log('Listening at ' + PORT );
});