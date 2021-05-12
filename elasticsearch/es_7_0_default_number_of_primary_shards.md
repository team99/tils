# Elasticsearch Changed the Default Number of Shards to 1 from 5 in ES 7.0

Before 7.0, Elasticsearch (ES) would create 5 shards per index, _by default_. (We can configure the number if we want to as well).
From 7.0 onwards, ES will create only one shard per index.

The advantage of having 5 shards per index is it can help with parallel processing on a single machine.
However, this can also be oversharding if the index is not too big.
So, the usecase for the change is that having a single shard per index helps with the case of one index per day (e.g logstash indexes -> logstash-2021.03.15).
If we do five shards per index per application (e.g one for logstash, one for istio, one for ABC app etc), it could grow into lots of shards. This also prevents oversharding.

## References

- [ES PR for Default to one shard](https://github.com/elastic/elasticsearch/pull/30539)
- [ES 7.0.0 Release note](https://www.elastic.co/blog/elasticsearch-7-0-0-released)
