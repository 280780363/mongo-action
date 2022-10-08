# MongoDb with single node cluster GitHub Action

This [GitHub Action](https://github.com/features/actions) sets up a MongoDb with sinel node cluster.

## Usage

```yaml
steps:
- uses: 280780363/mongo-action@v1.0
  with:
    version: latest # Optional, image tag version, default value is latest.
    username: mongo # Optional, default value is mongo.
    password: 123123 # Optional, default value is 123123.
```

Docker source [Docker Hub](https://hub.docker.com/_/mongo).