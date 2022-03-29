"use strict";
const { exec } = require("child_process");
const path = require("path");

const forked = exec(
  "mix phx.server",
  {
    cwd: path.join(__dirname, "..", "other-benchmarks/elixir-phoenix-absinthe"),
    env: {
      ...process.env,
      MIX_ENV: "prod",
      SECRET_KEY_BASE: "SECRET_KEY_BASE",
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
console.log(
  path.join(__dirname, "..", "other-benchmarks/elixir-phoenix-absinthe/"),
);
forked.on("exit", () => console.log("exited"));
