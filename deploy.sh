helm install stable/rabbitmq --name rabbit-demo --namespace rabbit-scaling-demo -f charts/rabbitmq/values.yaml
helm install --name prometheus --namespace rabbit-scaling-demo stable/prometheus -f charts/prometheus/config.yaml
helm install --name prometheus-adapter --namespace rabbit-scaling-demo stable/prometheus-adapter -f charts/prometheus-adapter/config.yaml
#helm install ./charts/demo-app --name demo-app --namespace hackweek-baker

helm upgrade --install rabbit-baker stable/rabbitmq  -f charts/rabbitmq-ha/values.yaml
helm upgrade --install prometheus stable/prometheus
helm upgrade --install prometheus-adapter stable/prometheus-adapter -f charts/prometheus-adapter/config.yaml
