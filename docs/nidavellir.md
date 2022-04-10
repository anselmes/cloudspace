# nidavellir

To start using your cluster, you need to run the following as a regular user:

```bash
  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

Alternatively, if you are the root user, you can run:

```bash
  export KUBECONFIG=/etc/kubernetes/admin.conf
```

You should now deploy a pod network to the cluster.
Run "`kubectl apply -f [podnetwork].yaml`" with one of the options listed at:
  <https://kubernetes.io/docs/concepts/cluster-administration/addons/>

You can now join any number of the control-plane node running the following command on each as root:

```bash
kubeadm join nidavellir.api.labsonline.ca:6443 --token 131mzf.6jouo60vw52pqsvu \
 --discovery-token-ca-cert-hash sha256:f5f67526f083dcfe9e196b0cd39d540b3d3a4a49b9bfa22c0177a15195d17c23 \
 --control-plane --certificate-key 57cf04f90380c7843b15c363dfcfb5f5b4b5c25ea830618b26c238048d923ccc
```

Please note that the certificate-key gives access to cluster sensitive data, keep it secret!
As a safeguard, uploaded-certs will be deleted in two hours; If necessary, you can use
"`kubeadm init phase upload-certs --upload-certs`" to reload certs afterward.

Then you can join any number of worker nodes by running the following on each as root:

```bash
kubeadm join nidavellir.api.labsonline.ca:6443 --token 131mzf.6jouo60vw52pqsvu \
 --discovery-token-ca-cert-hash sha256:f5f67526f083dcfe9e196b0cd39d540b3d3a4a49b9bfa22c0177a15195d17c23
```
