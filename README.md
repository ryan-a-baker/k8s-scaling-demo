# Deploy Tasks

## Publisher
'''kubectl run publish-tasks --image=theryanbaker/ryantest --replicas=1 publish'''

### Worker

kubectl run worker --image=theryanbaker/ryantest --replicas=1 worker


Delete the publisher quickly after to keep it from deploying tasks

```kubectl delete deployment publish-tasks```

# Check the status of the API service:

```kubectl get apiservices```

```v1beta1.custom.metrics.k8s.io          rabbitmq-scaling-demo/prometheus-adapter-scaling-demo   True        17m```

Check Results

```kubectl get --raw /apis/custom.metrics.k8s.io/v1beta1/namespaces/hackweek-baker/services/rabbit-baker-rabbitmq/rabbitmq_queue_messages```
