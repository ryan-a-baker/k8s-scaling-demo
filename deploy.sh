helm upgrade --install --namespace rabbitmq-scaling-demo rabbitmq-server-scaling-demo stable/rabbitmq  -f charts/rabbitmq/values.yaml
helm upgrade --install --namespace rabbitmq-scaling-demo prometheus-scaling-demo stable/prometheus
helm upgrade --install --namespace rabbitmq-scaling-demo prometheus-adapter-scaling-demo stable/prometheus-adapter -f charts/prometheus-adapter/config.yaml
helm upgrade --install --namespace rabbitmq-scaling-demo rabbitmq-scaling-demo-app ./charts/rabbitmq-sample-app
