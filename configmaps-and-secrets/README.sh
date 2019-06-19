#!/bin/bash
set -euo pipefail

# apply
kubectl apply -f deploy.yml

# look
pod=$(kubectl get pod -l app=test-configmaps-and-secrets --field-selector=status.phase=Running -ojsonpath='{.items[0].metadata.name}')
kubectl exec $pod -- bash -c 'env|sort'

# cleanup
kubectl delete -f deploy.yml

