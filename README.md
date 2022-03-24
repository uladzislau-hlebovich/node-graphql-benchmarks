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

# Benchmarks
Running on Digital Ocean's CPU-Optimized 4 GiB / 2 CPUs virtual server
duration: 5s
connections: 5
pipelining: 1

| Server                                                                                                                                                                  | Requests/s | Latency | Throughput/Mb |
| :--                                                                                                                                                                     | --:        | :-:     | --:           |
| [go-graphql](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/go-graphql.js)                                                                   | 9450.4     | 0.06    | 15.70         |
| [uWebSockets-graphql+jit](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/uWebSockets-graphql+jit.js)                                         | 3976.0     | 0.60    | 24.46         |
| [core-graphql-jit-str](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/core-graphql-jit-str.js)                                               | 3437.8     | 1.22    | 21.37         |
| [core-graphql-jit-buf](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/core-graphql-jit-buf.js)                                               | 3391.4     | 1.25    | 21.08         |
| [benzene-http](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/benzene-http.js)                                                               | 3320.2     | 1.28    | 20.80         |
| [core-graphql-jit-buf-fjs](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/core-graphql-jit-buf-fjs.js)                                       | 3272.2     | 1.30    | 20.34         |
| [mercurius+graphql-jit](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/mercurius+graphql-jit.js)                                             | 3113.4     | 1.32    | 19.49         |
| [fastify-REST](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/fastify-REST.js)                                                               | 2978.6     | 1.40    | 23.88         |
| [mercurius+graphql-jit+type-graphql](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/mercurius+graphql-jit+type-graphql.js)                   | 2236.8     | 1.76    | 14.00         |
| [mercurius+graphql-compose](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/mercurius+graphql-compose.js)                                     | 2212.0     | 1.80    | 13.85         |
| [mercurius](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/mercurius.js)                                                                     | 2171.8     | 1.83    | 13.60         |
| [graphql-api-koa+graphql-jit](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/graphql-api-koa+graphql-jit.js)                                 | 2084.2     | 1.87    | 13.03         |
| [express-REST](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/express-REST.js)                                                               | 2045.0     | 1.99    | 16.53         |
| [fastify-express-graphql-jit](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/fastify-express-graphql-jit.js)                                 | 1950.6     | 1.84    | 0.54          |
| [fastify-express-graphql-typed-jit](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/fastify-express-graphql-typed-jit.js)                     | 1898.6     | 1.93    | 0.52          |
| [express-gql](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/express-gql.js)                                                                 | 1883.0     | 2.07    | 11.91         |
| [apollo-server-fastify+graphql-jit](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/apollo-server-fastify+graphql-jit.js)                     | 1871.6     | 2.01    | 11.78         |
| [express-graphql+graphql-jit+graphql-compose](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/express-graphql+graphql-jit+graphql-compose.js) | 1676.6     | 2.64    | 10.60         |
| [express-graphql+graphql-jit](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/express-graphql+graphql-jit.js)                                 | 1617.0     | 2.76    | 10.23         |
| [graphql-api-koa](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/graphql-api-koa.js)                                                         | 1574.2     | 2.77    | 9.85          |
| [express-graphql+graphql-jit+type-graphql](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/express-graphql+graphql-jit+type-graphql.js)       | 1543.4     | 2.80    | 9.76          |
| [apollo-server-fastify](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/apollo-server-fastify.js)                                             | 1516.4     | 2.91    | 9.54          |
| [express-graphql+graphql-compose](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/express-graphql+graphql-compose.js)                         | 1360.0     | 3.14    | 8.60          |
| [graphql-compose+async](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/graphql-compose+async.js)                                             | 1335.6     | 3.20    | 8.45          |
| [express-graphql+type-graphql](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/express-graphql+type-graphql.js)                               | 1317.0     | 3.20    | 8.33          |
| [apollo-server-koa+graphql-jit+type-graphql](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/apollo-server-koa+graphql-jit+type-graphql.js)   | 1309.8     | 3.36    | 8.20          |
| [express-graphql](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/express-graphql.js)                                                         | 1308.4     | 3.27    | 8.28          |
| [apollo-schema+async](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/apollo-schema+async.js)                                                 | 1293.8     | 3.35    | 8.18          |
| [express-graphql-dd-trace-no-plugin](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/express-graphql-dd-trace-no-plugin.js)                   | 1292.2     | 3.31    | 8.17          |
| [type-graphql+async](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/type-graphql+async.js)                                                   | 1255.4     | 3.41    | 7.94          |
| [type-graphql+middleware](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/type-graphql+middleware.js)                                         | 1241.0     | 3.46    | 7.85          |
| [type-graphql+async-middleware](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/type-graphql+async-middleware.js)                             | 1200.8     | 3.56    | 7.59          |
| [fastify-express-grapql-typed](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/fastify-express-grapql-typed.js)                               | 1173.8     | 3.80    | 0.32          |
| [apollo-server-express](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/apollo-server-express.js)                                             | 952.0      | 4.89    | 6.05          |
| [yoga-graphql](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/yoga-graphql.js)                                                               | 681.5      | 4.66    | 0.30          |
| [apollo-opentracing](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/apollo-opentracing.js)                                                   | 667.0      | 7.01    | 4.24          |
| [yoga-graphql-trace](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/yoga-graphql-trace.js)                                                   | 665.0      | 4.97    | 0.29          |
| [express-graphql-dd-trace-less](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/express-graphql-dd-trace-less.js)                             | 646.6      | 7.26    | 4.09          |
| [express-graphql-dd-trace](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/express-graphql-dd-trace.js)                                       | 632.4      | 7.38    | 4.00          |
| [apollo-server-express-tracing](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/apollo-server-express-tracing.js)                             | 521.2      | 9.08    | 16.61         |
| [elixir-phoenix-absinthe](https://github.com/uladzislau-helbovich/node-graphql-benchmarks/tree/master/benchmarks/elixir-phoenix-absinthe.js)                                         | 228.4      | 21.34   | 1.46          |
