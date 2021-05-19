# Resizing Persistent Volums (PV)

1. Check the Persistent Volume Claims (PVC) (Optional)

    ```bash
    $ kubectl get pvc # or use -n for the namespace we want to check

    # example output
    data-logging-es-0         Bound    pvc-6f84794d-c19b-4df0-a7a4-0d99d249a1e9   1000Gi     RWO            standard       210d
    grafana                   Bound    pvc-cdd7aa60-8ebb-4e0c-8f79-3d3965c1b02e   10Gi       RWO            standard       219d
    prometheus-alertmanager   Bound    pvc-4d870d38-3e90-4d79-911b-b703bdad5b8a   2Gi        RWO            standard       221d
    prometheus-server         Bound    pvc-4eada8b0-3367-4714-928b-37b4f742d1cf   200Gi      RWO            standard       221d
    ```

2. Check the StorageClass (SC) of the PVC

    ```bash
    $ kubectl describe pvc data-logging-es-0 -n monitoring 
    Name:          data-logging-es-0
    Namespace:     monitoring
    StorageClass:  standard # this part 
    Status:        Bound
    Volume:        pvc-6f84794d-c19b-4df0-a7a4-0d99d249a1e9
    Labels:        app=elasticsearch
    Annotations:   pv.kubernetes.io/bind-completed: yes
                pv.kubernetes.io/bound-by-controller: yes
                volume.beta.kubernetes.io/storage-provisioner: kubernetes.io/gce-pd
    Finalizers:    [kubernetes.io/pvc-protection]
    Capacity:      1000Gi
    Access Modes:  RWO
    VolumeMode:    Filesystem
    Mounted By:    logging-es-0
    Events:        <none>
    ```

3. Change the StorgeClass `AllowVolumeExpansion` to `true` if it is not.
4. Edit the PVC `kubectl edit pvc pvc-name-here`. Change `spec.resources.requests.stoarge` to the amount we want
5. Now, we have to restart the Deployments that the volume is attached to. Do `kubectl rollout restart deployment <deployment name>`.
6. If we don't know which Deployment is using the volumes, we can use the follow command to find the Pods and the attached volumes.

    ```bash
    kubectl get pods --all-namespaces -o=json | jq -c '.items[] | {name: .metadata.name, namespace: .metadata.namespace, claimName: .spec |  select( has ("volumes") ).volumes[] | select( has ("persistentVolumeClaim") ).persistentVolumeClaim.claimName }'
    ```

## References

- [Expanding Persistent Volumes Claims](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#expanding-persistent-volumes-claims)