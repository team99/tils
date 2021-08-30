# Triggering a Kube Cronjob Manually

```bash
# kubectl create job --from=cronjob/<name of cronjob> <name of job>
kubectl create job --from=cronjob/backup-weekly manual-backup-weekly
```

### Reference
- [kubectl create job](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#-em-job-em-)
