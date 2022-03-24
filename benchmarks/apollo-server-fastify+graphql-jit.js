"use strict";

const { ApolloServer } = require("apollo-server-fastify");
const { parse } = require("graphql");
const { compileQuery } = require("graphql-jit");
const app = require("fastify")();
const { createApolloSchema } = require("../lib/schemas/createApolloSchema");

(async function () {
  const schema = createApolloSchema();

  const cache = {};

  const server = new ApolloServer({
    schema,
    executor: ({ source, context }) => {
      if (!(source in cache)) {
        const document = parse(source);
        cache[source] = compileQuery(schema, document);
      }

      return cache[source].query({}, context, {});
    },
  });
  await server.start();
  app.register(await server.createHandler());
  await app.listen(4001);
})();
