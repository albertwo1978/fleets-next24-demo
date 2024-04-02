# Setup Multi-Cluster Ingress on the Fleet
# https://cloud.google.com/kubernetes-engine/docs/how-to/multi-cluster-ingress-setup

east=cluster-east

# Alice connects to Fleet Cluster via Connect Gateway 
# https://cloud.google.com/anthos/multicluster-management/gateway/using
gcloud container fleet memberships get-credentials $east

# Specify a config cluster - East
gcloud container fleet ingress enable \
    --config-membership=$east \
    --location=us-east1 \
    --project=gke-runrate-reporting

# Confirm completion
gcloud container fleet ingress describe \
    --project=gke-runrate-reporting