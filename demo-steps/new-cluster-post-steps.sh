# Apply Group Memberships
# https://cloud.google.com/kubernetes-engine/docs/how-to/google-groups-rbac

gcloud container clusters update cluster-[REGION] \
    --region=us-[REGION]1-c \
    --security-group="gke-security-groups@wolchesky.altostrat.com"