# Pipeline Run Steps

Steps to setup triggers and run pipeline runs to create image with bar filss baked in it:

- oc apply --filename https://storage.googleapis.com/tekton-releases/pipeline/previous/v0.12.1/release.yaml
- oc apply -f https://storage.googleapis.com/tekton-releases/triggers/previous/v0.5.0/release.yaml
- kubectl get pods --namespace tekton-pipelines --watch
- expose route using doccker-registry
- docker login using image bot and create secret for docker (check `run-pipeline-install-subscription.yaml`)
- oc expose svc el-ace-cicd-trigger
- echo "$(oc  get route el-ace-cicd-trigger --template='http://{{.spec.host}}')"
- oc apply trigger.yaml file
- setup webhook in github using the route above got via el-ace-cicd-trigger
- it will run initially and apply all triggers, role and rolebinding and serviceaccount and will create a listener pod in the target namespace (ace for now)
