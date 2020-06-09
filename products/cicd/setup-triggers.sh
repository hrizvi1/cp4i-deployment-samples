#!/bin/bash -e

# tkn resource delete --all -f
tkn el delete --all -f
tkn tb delete --all -f
tkn tt delete --all -f
oc delete rolebinding tekton-triggers-rolebinding
oc delete role tekton-triggers-role

oc apply -f cicd-webhook-triggers.yaml