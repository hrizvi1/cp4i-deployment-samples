#!/bin/bash -e

# # export ICP_CONSOLE="$(oc get routes --all-namespaces | grep icp-console | awk '{print $3}')"

# # cloudctl login -a $ICP_CONSOLE -u admin -p ibm-cloud-private-admin-password -n ace

# oc patch configs.imageregistry.operator.openshift.io/cluster --patch '{"spec":{"defaultRoute":true}}' --type=merge

# export NAMESPACE=ace

# kubectl -n $NAMESPACE create serviceaccount image-bot

# oc -n $NAMESPACE policy add-role-to-user registry-editor system:serviceaccount:$NAMESPACE:image-bot

# export DOCKER_REGISTRY="$(kubectl get route -n openshift-image-registry default-route -o jsonpath='{.spec.host}')"

# export INTERNAL_REGISTRY="image-registry.openshift-image-registry.svc:5000/$NAMESPACE"

# echo $DOCKER_REGISTRY - include this registry in insecure registries in docker preferences

# export username=image-bot

# export password="$(oc -n $NAMESPACE serviceaccounts get-token image-bot)"

# docker login -u $username -p $password $DOCKER_REGISTRY

# oc adm policy add-scc-to-group privileged system:serviceaccounts:$NAMESPACE

# oc create secret docker-registry regcred --docker-server=$DOCKER_REGISTRY --docker-username=$username --docker-password=$password

# oc apply -f cicd-sa.yaml
oc apply -f cicd-resources.yaml
oc apply -f build-push-task.yaml
oc apply -f cicd-task-run.yaml