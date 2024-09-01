# Downloading Istio...
curl -L https://istio.io/downloadIstio | sh -

echo -e "Setting up Istio..."
cd istio-*
export PATH=$PWD/bin:$PATH
istioctl install --set profile=minimal -y

# Creating namespace for application and allowing 
echo "Adding namespace jumbotail-prod"
kubectl label namespace jumbotail-prod istio-injection=enabled
echo "Labelling namespace to enable Istio injection"

#Adding monitoring and loggin solutions
echo "Installing monitorring and logging solutions..."
echo "Installing Kiaki Istio manager"
kubectl apply -f ./samples/addons/


