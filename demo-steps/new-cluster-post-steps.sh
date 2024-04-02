region=east

# Configure Service Mesh
# https://cloud.google.com/service-mesh/docs/managed/provision-managed-anthos-service-mesh
gcloud container fleet mesh update \
    --management automatic \
    --memberships cluster-$region \
    --project gke-runrate-reporting \
    --location us-"$region"1


# Apply Group Memberships
# https://cloud.google.com/kubernetes-engine/docs/how-to/google-groups-rbac

gcloud container clusters update cluster-$region \
    --region=us-"$region"1-c \
    --security-group="gke-security-groups@wolchesky.altostrat.com"

    