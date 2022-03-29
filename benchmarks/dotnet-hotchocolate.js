"use strict";
const { exec } = require("child_process");
const path = require("path");

const pathToPublish =
  "other-benchmarks/HotChocolateBenchmark/bin/Release/net6.0/publish";

const forked = exec(
  "./HotChocolateBenchmark",
  {
    cwd: path.join(__dirname, "..", `${pathToPublish}`),
    env: {
      ...process.env,
      ASPNETCORE_URLS: "http://localhost:4001/",
    },
    maxBuffer: Infinity,
  },
  (error, stdout, stderr) => {
    if (error) {
      console.log(`error: ${error.message}`);
      return;
    }
    if (stderr) {
      console.log(`stderr: ${stderr}`);
      return;
    }
  },
);
console.log(path.join(__dirname, "..", pathToPublish));
forked.on("exit", () => console.log("exited"));
