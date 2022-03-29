# TL;DR

- graphql-jit helps
- apollo-server adds overhead
- tracing resolvers kills performance
- type-graphql adds overhead

# Explanation

For further details, please check out [this video](https://www.youtube.com/watch?v=JbV7MCeEPb8).

# Usage

```
git clone https://github.com/uladzislau-helbovich/benchmarks
cd benchmarks
npm install
npm start
```

Build elixir-phoenix-absinthe:

```
cd other-benchmarks/elixir-phoenix-absinthe
mix deps.get --only prod
MIX_ENV=prod mix compile
```

Build go-gql:

```
cd other-benchmarks/go-gql
go build -ldflags "-s -w".
```

Build HotChocolateBenchmark:

```
cd other-benchmarks/HotChocolateBenchmark
dotnet publish --configuration Release
```

# Benchmarks

Running on Digital Ocean's CPU-Optimized 4 GiB / 2 CPUs virtual server

duration: 5s
connections: 5
pipelining: 1

| Server                                                                                                                                                                               | Requests/s | Latency | Throughput/Mb |
| :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------: | :-----: | ------------: |
| [uWebSockets-graphql+jit](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/uWebSockets-graphql+jit.js)                                         |     3491.4 |  1.19   |         13.52 |
| [core-graphql-jit-buf](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/core-graphql-jit-buf.js)                                               |     2854.2 |  1.33   |         11.23 |
| [core-graphql-jit-str](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/core-graphql-jit-str.js)                                               |     2835.8 |  1.33   |         11.16 |
| [core-graphql-jit-buf-fjs](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/core-graphql-jit-buf-fjs.js)                                       |     2827.8 |  1.33   |         11.13 |
| [benzene-http](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/benzene-http.js)                                                               |     2768.6 |  1.32   |         11.03 |
| [dotnet-hotchocolate](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/dotnet-hotchocolate.js)                                                 |     2729.4 |  1.33   |          9.31 |
| [mercurius+graphql-jit](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/mercurius+graphql-jit.js)                                             |     2651.8 |  1.38   |         10.55 |
| [fastify-REST](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/fastify-REST.js)                                                               |     2104.8 |  1.85   |         11.01 |
| [mercurius](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/mercurius.js)                                                                     |     1847.4 |  2.11   |          7.35 |
| [mercurius+graphql-compose](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/mercurius+graphql-compose.js)                                     |     1829.8 |  2.11   |          7.28 |
| [express-REST](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/express-REST.js)                                                               |     1751.0 |  2.27   |          9.27 |
| [mercurius+graphql-jit+type-graphql](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/mercurius+graphql-jit+type-graphql.js)                   |     1711.8 |  2.44   |          6.81 |
| [graphql-api-koa+graphql-jit](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/graphql-api-koa+graphql-jit.js)                                 |     1694.6 |  2.56   |          6.73 |
| [fastify-express-graphql-jit](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/fastify-express-graphql-jit.js)                                 |     1515.8 |  2.82   |          0.42 |
| [express-gql](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/express-gql.js)                                                                 |     1496.2 |  2.95   |          6.05 |
| [go-graphql](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/go-graphql.js)                                                                   |     1476.0 |  2.93   |          5.60 |
| [apollo-server-fastify+graphql-jit](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/apollo-server-fastify+graphql-jit.js)                     |     1465.8 |  2.92   |          5.88 |
| [fastify-express-graphql-typed-jit](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/fastify-express-graphql-typed-jit.js)                     |     1465.4 |  2.88   |          0.40 |
| [graphql-api-koa](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/graphql-api-koa.js)                                                         |     1307.6 |  3.23   |          5.20 |
| [express-graphql+graphql-jit+graphql-compose](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/express-graphql+graphql-jit+graphql-compose.js) |     1286.2 |  3.31   |          5.20 |
| [express-graphql+graphql-jit](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/express-graphql+graphql-jit.js)                                 |     1286.2 |  3.34   |          5.20 |
| [express-graphql+graphql-jit+type-graphql](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/express-graphql+graphql-jit+type-graphql.js)       |     1194.0 |  3.67   |          4.83 |
| [apollo-server-fastify](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/apollo-server-fastify.js)                                             |     1163.8 |  3.82   |          4.67 |
| [fastify-express-grapql-typed](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/fastify-express-grapql-typed.js)                               |     1140.8 |  3.91   |          0.31 |
| [express-graphql+graphql-compose](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/express-graphql+graphql-compose.js)                         |     1065.6 |  4.23   |          4.31 |
| [graphql-compose+async](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/graphql-compose+async.js)                                             |     1019.0 |  4.39   |          4.12 |
| [apollo-server-koa+graphql-jit+type-graphql](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/apollo-server-koa+graphql-jit+type-graphql.js)   |     1016.4 |  4.40   |          4.05 |
| [express-graphql-dd-trace-no-plugin](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/express-graphql-dd-trace-no-plugin.js)                   |     1013.0 |  4.42   |          4.10 |
| [express-graphql](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/express-graphql.js)                                                         |     1007.6 |  4.43   |          4.07 |
| [apollo-schema+async](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/apollo-schema+async.js)                                                 |      988.2 |  4.54   |          4.00 |
| [type-graphql+async](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/type-graphql+async.js)                                                   |      986.2 |  4.54   |          3.99 |
| [express-graphql+type-graphql](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/express-graphql+type-graphql.js)                               |      948.2 |  4.73   |          3.83 |
| [type-graphql+middleware](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/type-graphql+middleware.js)                                         |      926.2 |  4.85   |          3.74 |
| [type-graphql+async-middleware](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/type-graphql+async-middleware.js)                             |      890.0 |  5.11   |          3.60 |
| [apollo-server-express](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/apollo-server-express.js)                                             |      736.0 |  6.30   |          3.00 |
| [yoga-graphql-trace](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/yoga-graphql-trace.js)                                                   |      579.8 |  10.84  |          0.26 |
| [yoga-graphql](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/yoga-graphql.js)                                                               |      563.3 |  13.22  |          0.25 |
| [elixir-phoenix-absinthe](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/elixir-phoenix-absinthe.js)                                         |      549.6 |  8.57   |          3.58 |
| [apollo-opentracing](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/apollo-opentracing.js)                                                   |      523.2 |  9.04   |          2.13 |
| [express-graphql-dd-trace-less](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/express-graphql-dd-trace-less.js)                             |      489.8 |  9.68   |          1.98 |
| [express-graphql-dd-trace](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/express-graphql-dd-trace.js)                                       |      458.6 |  10.38  |          1.85 |
| [apollo-server-express-tracing](https://github.com/uladzislau-hlebovich/node-graphql-benchmarks/tree/master/benchmarks/apollo-server-express-tracing.js)                             |      443.0 |  10.81  |         13.12 |
