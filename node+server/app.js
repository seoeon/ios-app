const express = require("express");
const fs = require("fs");
const bp = require("body-parser");

app = express();

// Get last primary key index
var dirnames = fs.readdirSync("db");
nextPrimaryKey = dirnames.length;
if (isNaN(nextPrimaryKey)) {
	nextPrimaryKey = 0;
}

app.use(function (req, res, next) {
	res.setHeader('Content-Type', 'application/json');
	next();
});

app.use(bp.json({limit:'30mb', extended:true}));
app.use(bp.urlencoded({extended: true}));

app.get('/list/:startIndex', (req, res) => {
	const response = [];

	try {
		const startIndex = parseInt(req.params.startIndex);
		const maxIndex = parseInt(req.params.startIndex) + 7;

		for(let index = startIndex; index < maxIndex; index++) {
			const contents = fs.readFileSync("db/" + index + "/d", encoding="utf-8");
			const jsonContents = JSON.parse(contents);
			response.push({id : index, title:jsonContents.title, contents:jsonContents.contents, img:jsonContents.img});
		}
	} catch(e) {}

	res.json(response);
});

app.post('/post', (req, res) => {
	const dirName = "db/" + nextPrimaryKey++;

	fs.mkdirSync(dirName);
	fs.writeFileSync(dirName + "/d", JSON.stringify(req.body));

	res.json({success : true});
});

app.listen(6033);