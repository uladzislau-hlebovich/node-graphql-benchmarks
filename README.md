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
| [go-graphql](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/go-graphql.js)                                                                   |     9616.8 |  0.06   |         15.97 |
| [uWebSockets-graphql+jit](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/uWebSockets-graphql+jit.js)                                         |     3860.2 |  0.86   |         23.75 |
| [core-graphql-jit-buf](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/core-graphql-jit-buf.js)                                               |     3376.2 |  1.26   |         20.98 |
| [benzene-http](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/benzene-http.js)                                                               |     3371.0 |  1.25   |         21.12 |
| [core-graphql-jit-str](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/core-graphql-jit-str.js)                                               |     3358.6 |  1.25   |         20.87 |
| [core-graphql-jit-buf-fjs](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/core-graphql-jit-buf-fjs.js)                                       |     3258.2 |  1.31   |         20.25 |
| [mercurius+graphql-jit](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/mercurius+graphql-jit.js)                                             |     2988.6 |  1.35   |         18.71 |
| [fastify-REST](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/fastify-REST.js)                                                               |     2916.6 |  1.37   |         23.39 |
| [mercurius+graphql-compose](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/mercurius+graphql-compose.js)                                     |     2200.2 |  1.78   |         13.77 |
| [mercurius+graphql-jit+type-graphql](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/mercurius+graphql-jit+type-graphql.js)                   |     2098.0 |  1.91   |         13.13 |
| [graphql-api-koa+graphql-jit](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/graphql-api-koa+graphql-jit.js)                                 |     2088.8 |  1.84   |         13.06 |
| [express-REST](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/express-REST.js)                                                               |     2054.8 |  1.97   |         16.61 |
| [fastify-express-graphql-typed-jit](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/fastify-express-graphql-typed-jit.js)                     |     1899.6 |  1.93   |          0.52 |
| [apollo-server-fastify+graphql-jit](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/apollo-server-fastify+graphql-jit.js)                     |     1850.8 |  2.02   |         11.64 |
| [express-gql](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/express-gql.js)                                                                 |     1842.2 |  2.12   |         11.65 |
| [fastify-express-graphql-jit](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/fastify-express-graphql-jit.js)                                 |     1841.0 |  2.03   |          0.51 |
| [mercurius](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/mercurius.js)                                                                     |     1762.8 |  2.33   |         11.04 |
| [express-graphql+graphql-jit+graphql-compose](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/express-graphql+graphql-jit+graphql-compose.js) |     1673.4 |  2.64   |         10.59 |
| [express-graphql+graphql-jit](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/express-graphql+graphql-jit.js)                                 |     1609.6 |  2.77   |         10.18 |
| [graphql-api-koa](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/graphql-api-koa.js)                                                         |     1593.8 |  2.76   |          9.97 |
| [fastify-express-grapql-typed](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/fastify-express-grapql-typed.js)                               |     1555.4 |  2.78   |          0.43 |
| [express-graphql+graphql-jit+type-graphql](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/express-graphql+graphql-jit+type-graphql.js)       |     1525.8 |  2.87   |          9.65 |
| [apollo-server-fastify](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/apollo-server-fastify.js)                                             |     1480.2 |  2.92   |          9.31 |
| [express-graphql+graphql-compose](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/express-graphql+graphql-compose.js)                         |     1349.0 |  3.16   |          8.53 |
| [graphql-compose+async](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/graphql-compose+async.js)                                             |     1329.2 |  3.22   |          8.41 |
| [express-graphql](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/express-graphql.js)                                                         |     1282.6 |  3.33   |          8.11 |
| [express-graphql-dd-trace-no-plugin](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/express-graphql-dd-trace-no-plugin.js)                   |     1282.2 |  3.34   |          8.11 |
| [apollo-schema+async](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/apollo-schema+async.js)                                                 |     1271.6 |  3.38   |          8.04 |
| [express-graphql+type-graphql](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/express-graphql+type-graphql.js)                               |     1259.4 |  3.40   |          7.97 |
| [apollo-server-koa+graphql-jit+type-graphql](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/apollo-server-koa+graphql-jit+type-graphql.js)   |     1247.6 |  3.55   |          7.81 |
| [type-graphql+async](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/type-graphql+async.js)                                                   |     1236.8 |  3.46   |          7.82 |
| [type-graphql+async-middleware](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/type-graphql+async-middleware.js)                             |     1176.6 |  3.65   |          7.44 |
| [elixir-phoenix-absinthe](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/elixir-phoenix-absinthe.js)                                         |     1000.2 |  1.01   |          0.25 |
| [type-graphql+middleware](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/type-graphql+middleware.js)                                         |      958.2 |  4.66   |          6.06 |
| [apollo-server-express](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/apollo-server-express.js)                                             |      935.6 |  4.97   |          5.95 |
| [yoga-graphql](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/yoga-graphql.js)                                                               |      676.0 |  4.21   |          0.30 |
| [apollo-opentracing](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/apollo-opentracing.js)                                                   |      673.0 |  6.99   |          4.28 |
| [yoga-graphql-trace](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/yoga-graphql-trace.js)                                                   |      671.5 |  4.85   |          0.30 |
| [express-graphql-dd-trace-less](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/express-graphql-dd-trace-less.js)                             |      634.8 |  7.42   |          4.02 |
| [express-graphql-dd-trace](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/express-graphql-dd-trace.js)                                       |      614.2 |  7.62   |          3.88 |
| [apollo-server-express-tracing](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/apollo-server-express-tracing.js)                             |      525.0 |  8.95   |         16.74 |
