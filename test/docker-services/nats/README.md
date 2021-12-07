# NATS service

## Introduction
NATS messaging enables the exchange of data that is segmented into messages among computer applications and services. These messages are addressed by subjects and do not depend on network location. This provides an abstraction layer between the application or service and the underlying physical network. Data is encoded and framed as a message and sent by a publisher. The message is received, decoded, and processed by one or more subscribers.

### Rollout script
```shell
sh restart_service.sh
```

### Database managing
```shell
sh run_sql.sh
```

### Test script (STAN)
```shell
sh scripts/test-stan.sh
```

### Requirements
1. Docker/Kubernetes for virtualization
2. Python3+ including NATS package (pip install asyncio-nats-streaming)

### Links
- https://github.com/nats-io/nats-streaming-server
- https://hub.kubeapps.com/charts/nats/stan/0.5.2
- https://docs.nats.io/nats-on-kubernetes/minimal-setup
- https://kubernetes.io/blog/2017/02/postgresql-clusters-kubernetes-statefulsets/
- https://kubernetes.io/blog/2016/09/creating-postgresql-cluster-using-helm/
- https://access.crunchydata.com/documentation/postgres-operator/v5/quickstart/
