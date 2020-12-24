// Auto replace old version numbers
// this script searches and replaces the old version numbers in the library
// and changes them to reflect latest tagged version of the library for release

// created by oran collins
// github.com/wisehackermonkey
// oranbusiness@gmail.com
// 20200701

// the version of the package is found in the file
// package.json
// {
//   "name": "p5.collide2d",
//   "version": "0.7.1", <-here
//   ...
// }

let package_json = require("./package.json");
let version = package_json.version;

console.log(`Updating Package to version: ` + version)

const replace = require("replace-in-file");

// replace all instances of pattern "vX.X.X" within the file p5.collide2d.js
// EX: v0.7.1 -> v0.8.1  
try {
    const results = replace.sync({
        files: "p5.collide2d.js",
        // example of what regex does regexr.com/57k30
        from: /(v)(\d+)\.(\d+)\.(\d+)/g,
        to: "v" + version,
    });
    console.log("Replacement results:", results);
} catch (error) {
    console.error("Error occurred:", error);
}
