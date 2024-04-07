###############################
##  Review Before Session    ##
###############################
https://cloud.google.com/anthos/multicluster-management/gateway


###############################
##  Setup Steps              ##
###############################
# 1. Open incognito browser and have these two tabs open and authenticated as Alice
https://auth.cloud.google/signin/locations/global/workforcePools/okta-idp/providers/okta-oidc-provider?continueUrl=https://console.cloud.google/
https://frontend.endpoints.fleet-dev-1.cloud.goog/
# 2. Have VS Code window opened and set to next24-waynenewton folder (root of documents)
# 3. Run the following commands to pull down the output file
#    - gcloud projects get-iam-policy fleet-dev-1 --format json > output.json
#    - gcloud projects set-iam-policy fleet-dev-1 output.json
# 4. Prestage the okta-login.json file - from here: https://github.com/knee-berts/fleets-next24-demo/blob/dev/okta-login.json
# 5. Prestage steps.sh
# 6. Create the welcome-site folder and prestage the following files: 
#    - welcome-dr.yaml
#    - welcome-site.yaml
#    - welcome-vs.yaml
# 7. Login and create shorter context
#    kubectl config rename-context connectgateway_fleet-dev-1_us-central1_gke-dev-us-central1-00 central
#    kubectl config rename-context connectgateway_fleet-dev-1_us-east1_gke-dev-us-east1-02 east
#    kubectl config rename-context connectgateway_fleet-dev-1_us-west1_gke-dev-us-west1-00 west
# 8. Create aliases?
alias creds="gcloud container fleet memberships get-credentials gke-dev-us-central1-00 --location us-central1"
# 9. Logout

###############################
##  Alice Steps              ##
###############################
# Steps: 
# 1. Callouts
#    - Clusters
#    - Each tab in Team Scope
#    - Call out cost optimization tab
#    - Show browser app with only frontend
# 2. Create Namespace - whereami-backend
#    - Walk through Config and explain what's happening
#    - Show Monitoring with new resources
#    - Refresh browser to show backend
# 3. Try to create cluster and call out I don't have permission
#    - Ask Nick for his super powers
# 4. Reopen Incognito browser - Alice session
#    - Show Config and explain what's happening
#    - Show that backend now goes to central - pause for applause


###############################
##  Wayne Newton Steps       ##
###############################
# Login via Okta
# Login: wayne.newton@bidness.com
# Pw: [Not gonna do it!]
https://auth.cloud.google/signin/locations/global/workforcePools/okta-idp/providers/okta-oidc-provider?continueUrl=https://console.cloud.google/

# Steps: 
# 1. Demo login via Workforce Identity Federation - Okta (see above)
# 1. Highlight Team Scope - I should only see team-mrlasvegas
# 2. Create namespace - welcome
# 3. Switch to prestaged VS Code window and login: 
cat okta-login.json # Show okta login creds
gcloud auth login --login-config=okta-login.json
gcloud config list
gcloud config set project fleet-dev-1
gcloud container fleet memberships list # Call out Connect Gateway and Workforce Identity Federation
gcloud container fleet memberships get-credentials gke-dev-us-central1-00 --location us-central1 
kubectl get ns # This will fail as expected
kubectl get ns welcome
# 4. Show contents of welcome folder
#    - Deploy folder contents
kubectl apply -f welcome-site
# 5. Go to this URL for the finale
https://welcome.endpoints.fleet-dev-1.cloud.goog/