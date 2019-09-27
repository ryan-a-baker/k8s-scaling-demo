helm upgrade --install rabbit-demo stable/rabbitmq  -f charts/rabbitmq/values.yaml
helm upgrade --install prometheus stable/prometheus
helm upgrade --install prometheus-adapter stable/prometheus-adapter -f charts/prometheus-adapter/config.yaml
