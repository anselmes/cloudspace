#!/bin/bash

# add calico
# helm upgrade -i calico tigera-operator \
#   --repo https://projectcalico.docs.tigera.io/charts \
#   --namespace kube-system

# calico vpp prereq
cat <<-eof > /etc/module-load.d/kubernetes.conf
vfio-pci
eof
cat <<-eof > /etc/sysctl.d/kubernetes.conf
vm.nr_hugepages = 512
eof
modpro vfio-pci
sysctl --system

# install calico
kubectl apply -f https://projectcalico.docs.tigera.io/manifests/tigera-operator.yaml
kubectl apply -f https://raw.githubusercontent.com/projectcalico/vpp-dataplane/master/yaml/calico/installation-default.yaml

# calico dataplane component
# If you have configured hugepages on your machines
curl -o calico-vpp.yaml https://raw.githubusercontent.com/projectcalico/vpp-dataplane/master/yaml/generated/calico-vpp.yaml
sed -i 's/vpp_dataplane_interface.*/vpp_dataplane_interface: ${CALICO_VPP_DATAPLANE_INTERFACE}'
kubectl apply -f calico-vpp.yaml
rm -f calico-vpp.yaml
