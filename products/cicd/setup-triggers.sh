#!/bin/bash -e

tkn resource delete --all -f
tkn tasks delete --all -f
tkn taskruns delete --all -f
tkn pipelines delete --all -f
tkn pipelineruns delete --all -f
tkn eventlisteners delete --all -f
tkn triggerbindings delete --all -f
tkn triggertemplate delete --all -f
oc delete rolebinding tekton-triggers-rolebinding
oc delete role tekton-triggers-role

# oc apply -f cicd-webhook-triggers.yaml

oc apply -f trigger-build.pipeline.yaml