# knowhere

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
kubeadm join knowhere.api.labsonline.ca:6443 --token hirb83.4kilu0zy2k9v34ab \
 --discovery-token-ca-cert-hash sha256:df34a5eeab2c8ede9bf796cdbbcf5086e4342afb34ff55ba27fff364b31181b2 \
 --control-plane --certificate-key 2a7a5c505b454b8b307c44a3fed871ee55f41239c9204d392ac9cc80d2a32485
```

Please note that the certificate-key gives access to cluster sensitive data, keep it secret!
As a safeguard, uploaded-certs will be deleted in two hours; If necessary, you can use
"`kubeadm init phase upload-certs --upload-certs`" to reload certs afterward.

Then you can join any number of worker nodes by running the following on each as root:

```bash
kubeadm join knowhere.api.labsonline.ca:6443 --token hirb83.4kilu0zy2k9v34ab \
 --discovery-token-ca-cert-hash sha256:df34a5eeab2c8ede9bf796cdbbcf5086e4342afb34ff55ba27fff364b31181b2
```
