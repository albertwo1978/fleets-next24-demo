region=east
gcloud beta container --project "gke-runrate-reporting" clusters create "cluster-$region" --no-enable-basic-auth --cluster-version "1.27.8-gke.1067004" --release-channel "regular" --machine-type "n2-standard-4" --image-type "COS_CONTAINERD" --disk-type "pd-balanced" --disk-size "100" --metadata disable-legacy-endpoints=true --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --num-nodes "3" --logging=SYSTEM,WORKLOAD,API_SERVER,SCHEDULER,CONTROLLER_MANAGER --monitoring=SYSTEM,API_SERVER,SCHEDULER,CONTROLLER_MANAGER,STORAGE,POD,DEPLOYMENT,STATEFULSET,DAEMONSET,HPA --enable-ip-alias --network "projects/gke-runrate-reporting/global/networks/default" --subnetwork "projects/gke-runrate-reporting/regions/us-"$region"1/subnetworks/default" --no-enable-intra-node-visibility --default-max-pods-per-node "110" --security-posture=standard --workload-vulnerability-scanning=enterprise --no-enable-master-authorized-networks --addons HorizontalPodAutoscaling,HttpLoadBalancing,GcePersistentDiskCsiDriver --enable-autoupgrade --enable-autorepair --max-surge-upgrade 1 --max-unavailable-upgrade 0 --labels mesh_id=proj-522201394256 --binauthz-evaluation-mode=DISABLED --enable-managed-prometheus --workload-pool "gke-runrate-reporting.svc.id.goog" --enable-shielded-nodes --fleet-project=gke-runrate-reporting --node-locations "us-"$region"1-c" --zone "us-"$region"1-c" --labels location=$region