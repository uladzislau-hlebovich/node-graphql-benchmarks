"use strict";

const { ApolloServer } = require("apollo-server-fastify");
const app = require("fastify")();
const { createApolloSchema } = require("../lib/schemas/createApolloSchema");

(async function () {
  const schema = createApolloSchema();
  const server = new ApolloServer({
    schema,
  });
  await server.start();
  app.register(await server.createHandler());
  app.listen(4001);
})();
