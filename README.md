# Introduction

This is a demo deployment which will illustrate leveraging a Kubernetes custom metric to scale pods based on the depth of a RabbitMQ pod.  It leverages RabbitMQ-Server, Prometheus, Prometheus Adapter, and a sample python worker and publisher script.

This repo is meant to go along with my [blog post](https://ryanbaker.io/2019-10-07-scaling-rabbitmq-on-k8s/).

# Requirements

Everything you need to deploy this demo is located within this repo.  However, there are a few requirements you will need in order to get it working:

1.  A Kubernetes Cluster with kubectl setup([minikube](https://kubernetes.io/docs/setup/learning-environment/minikube/) will be fine)
2.  Helm deployed to the K8S cluster and a local helm client (Instructions [here](https://helm.sh/docs/using_helm/))
3.  Support for HPA version v2beta2 (`kubectl get apiservices | grep "autoscaling"`)

# Deployment

To make this as easy as possible, I have included a [deploy.sh script](https://github.com/ryan-a-baker/k8s-scaling-demo/blob/master/deploy.sh), which will deploy all the helm charts that are needed, as well as deploying a sample consumer of messages.  

To get started, clone the repo the repo locally, then run the deploy script

```
./deploy.sh
```

This will deploy the RabbitMQ, Prometheus, Prometheus Adapter, and a sample RabbitMQ python application..

# Playing with the example

If you are interested in an explanation of how all the components work together, it would be best to check out my [blog post](https://ryanbaker.io/2019-10-07-scaling-rabbitmq-on-k8s/).

If you just want to published messages to RabbitMQ and see the HPA scale the number of worker pods, just run the following command:

 ```
 kubectl run publish -it --rm --image=theryanbaker/rabbitmq-scaling-demo --restart=Never publish 500
 ```

 The HPA is set to scale at 100 messages per pod, so make sure you publish at least more than 100 (plus some additional give the HPA time to scale)

# Cleanup

Once you are done testing, you can run the `destroy.sh` script to clean up all the provisioned resources.  Make sure to delete the namespace from Kubernetes once you are completed done to delete the PVC as well.
