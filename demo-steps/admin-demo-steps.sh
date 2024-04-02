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

# Create Team Scope
# https://cloud.google.com/anthos/fleet-management/docs/setup-teams

# Grant permissions to make changes
gcloud projects add-iam-policy-binding gke-runrate-reporting \
    --member user:admin@wolchesky.altostrat.com \
    --role='roles/gkehub.admin'

# Create Group Memberships
# https://cloud.google.com/kubernetes-engine/docs/how-to/google-groups-rbac
# Created Groups team-a and team-b
# Added Alicev1 to team-a

# Update clusters - Add default security group
gcloud container clusters update cluster-central \
    --region=us-central1-c \
    --security-group="gke-security-groups@wolchesky.altostrat.com"

gcloud container clusters update cluster-east \
    --region=us-east1-c \
    --security-group="gke-security-groups@wolchesky.altostrat.com"

gcloud container clusters update cluster-west \
    --region=us-west1-c \
    --security-group="gke-security-groups@wolchesky.altostrat.com"

# Add team-a permissions to Fleet
gcloud projects add-iam-policy-binding gke-runrate-reporting \
   --member=group:team-a@wolchesky.altostrat.com \
   --role=roles/gkehub.viewer

gcloud projects add-iam-policy-binding gke-runrate-reporting \
   --member=group:team-a@wolchesky.altostrat.com \
   --role=roles/gkehub.gatewayEditor

# Create team-a Team Scope and create Team NS - Grant team-a access this scope
gcloud container fleet scopes create team-a
gcloud container fleet scopes namespaces create team-a-ns1 --scope=team-a
gcloud container fleet scopes rbacrolebindings create team-a-rbac-scope \
   --scope=team-a \
   --role=admin \
   --group=team-a@wolchesky.altostrat.com

