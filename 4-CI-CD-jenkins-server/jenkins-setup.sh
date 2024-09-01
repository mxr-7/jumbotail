#Install jenkins using helm
helm repo add jenkins https://charts.jenkins.io
helm repo update
kubectl create namespace jenkins
helm install jenkins jenkins/jenkins --namespace jenkins

#Get admin password for login
echo "Jenkins Password: "
kubectl -n jenkins get secret jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode

echo -e ""
echo -e "Waiting for Jenkins pod to come up.... This may take 1-2 mins"
sleep 100
#Port forward jenkins to connect through brower
kubectl -n jenkins port-forward svc/jenkins 8080:8080

