# List and authenicate to cluster in the Fleet
east=cluster-east
central=cluster-central
west=cluster-west

# Alice connects to Fleet Cluster via Connect Gateway 
# https://cloud.google.com/anthos/multicluster-management/gateway/using
gcloud container fleet memberships get-credentials $east

# Check Fleet NS
# https://cloud.google.com/anthos/fleet-management/docs/setup-teams#manage_team_scopes
gcloud container fleet memberships list

#
