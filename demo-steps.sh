# Reviewed Material:
# https://cloud.google.com/anthos/fleet-management/docs/team-management
# https://cloud.google.com/anthos/multicluster-management/gateway
# https://cloud.google.com/anthos/identity
# 

# List and authenicate to cluster in the Fleet
east=cluster-east
central=cluster-central
west=cluster-west

gcloud container fleet memberships list

gcloud container fleet memberships get-credentials $east


# Grant user rights to connect to Connect Gateway and perform admin tasks (ex. kubectl)
# https://cloud.google.com/anthos/multicluster-management/gateway/setup
gcloud projects add-iam-policy-binding gke-runrate-reporting \
    --member=user:alicev1@wolchesky.altostrat.com \
    --role=roles/gkehub.gatewayAdmin
gcloud projects add-iam-policy-binding gke-runrate-reporting \
    --member=user:alicev1@wolchesky.altostrat.com \
    --role=roles/gkehub.viewer

# Cloud UI Access
gcloud projects add-iam-policy-binding gke-runrate-reporting \
    --member=user:alicev1@wolchesky.altostrat.com \
    --role=roles/container.viewer
gcloud projects add-iam-policy-binding gke-runrate-reporting \
    --member=user:alicev1@wolchesky.altostrat.com \
    --role=roles/gkehub.viewer

# Alice connects to Fleet Cluster via Connect Gateway 
# https://cloud.google.com/anthos/multicluster-management/gateway/using
gcloud container fleet memberships get-credentials $east


