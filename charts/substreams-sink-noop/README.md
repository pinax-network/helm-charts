# substreams-sink-noop

![Version: 4.5.0](https://img.shields.io/badge/Version-4.5.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.3.1](https://img.shields.io/badge/AppVersion-v1.3.1-informational?style=flat-square)

A Helm chart for Kubernetes

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| alertManager.critBlockTime | int | `90` | Threshold in seconds for triggering a critical alert for head block time drift |
| alertManager.enabled | bool | `false` | Set to true if AlertManager integration is enabled |
| alertManager.namespace | object | `{}` | The namespace where head_block_time_drift metrics are collected |
| alertManager.warnBlockTime | int | `30` | Threshold in seconds for triggering a warning alert for head block time drift |
| autoscaling.enabled | bool | `false` | Specifies whether the Horizontal Pod Autoscaler is enabled |
| autoscaling.maxReplicas | int | `5` | Specifies the maximum number of replicas that the autoscaler can scale up to. |
| autoscaling.minReplicas | int | `1` | Specifies the minimum number of replicas that the autoscaler can scale down to. |
| autoscaling.targetCPUUtilizationPercentage | int | `80` | Specifies the target average CPU utilization (represented as a percentage of requested CPU) across all replicas. The autoscaler will adjust the number of replicas to maintain this average utilization. |
| autoscaling.targetMemoryUtilizationPercentage | int | `80` | Specifies the target average memory utilization (represented as a percentage of requested memory) across all replicas. The autoscaler will adjust the number of replicas to maintain this average utilization. |
| fullnameOverride | string | `""` | Overrides the full name of the chart. If not set, the full name will be derived from the release name and the chart name. |
| image.pullPolicy | string | `"IfNotPresent"` | Specifies the policy for pulling the image (e.g., Always, IfNotPresent, Never) |
| image.repository | string | `"ghcr.io/streamingfast/substreams-sink-noop"` | Image for substreams-sink-noop |
| image.tag | string | Chart.appVersion | Overrides the image tag |
| imagePullSecrets | list | `[]` | Pull secrets required to fetch the Image |
| nameOverride | string | `""` | Overrides the name of the chart. If not set, the name will be derived from the chart name. |
| noop.blocksVersion | object | `{}` | The version of the blocks to use, v1, v2 etc. |
| noop.endpoint | object | `{}` | The endpoint to connect to the network, defaults to mainnet.eth.streamingfast.io:443 |
| noop.extraArgs | object | `{}` | Additional CLI arguments to pass to sink-noop |
| noop.manifest | object | `{}` | The URL of the manifest file, defaults to https://github.com/streamingfast/substreams-eth-block-meta/releases/download/v0.4.1/substreams-eth-block-meta-v0.4.1.spkg |
| noop.module | object | `{}` | The name of the module to use from the manifest, defaults to graph_out |
| noop.networkName | object | `{}` | The name of the network to connect to, defaults to ethereum |
| noop.nodeSelector | object | `{}` | nodeSelector is used to specify the nodes on which this pod should be scheduled. An empty nodeSelector means that the pod can be scheduled on any node. |
| noop.podAnnotations | object | `{}` | podAnnotations are custom metadata added to the pod. These annotations can be used by various tools and controllers within Kubernetes. |
| noop.podSecurityContext | object | `{}` | podSecurityContext defines security settings for the pod. This includes settings like running the pod as a specific user, setting filesystem permissions, etc. |
| noop.service.clusterIP | object | `{}` | Specifies the cluster IP address of the service. If not specified, a cluster IP will be automatically assigned. |
| noop.service.ipFamilyPolicy | object | `{}` | Specifies the IP family policy for the service. Valid options are "SingleStack", "PreferDualStack", and "RequireDualStack". |
| noop.service.ports.grpc | int | `8080` | Specifies the port for the Substreams GRPC interface. This port will be exposed by the service. |
| noop.service.ports.metrics | int | `9102` | Specifies the port for the metrics interface. This port will be exposed by the service. |
| noop.service.type | string | `"ClusterIP"` | Specifies the type of the Kubernetes service. Valid options are "ClusterIP", "NodePort", "LoadBalancer", and "ExternalName". |
| noop.serviceMonitor | object | `{"enabled":false,"interval":"30s","scrapeTimeout":"10s"}` | stopBlock specifies the block number at which the process should stop. This value is commented out, so the process will continue indefinitely unless uncommented and set. stopBlock: "1000000" Configuration for the service monitor |
| noop.serviceMonitor.enabled | bool | `false` | Enable or disable the service monitor |
| noop.serviceMonitor.interval | string | `"30s"` | Interval at which Prometheus scrapes metrics |
| noop.serviceMonitor.scrapeTimeout | string | `"10s"` | Timeout for the scrape request |
| noop.terminationGracePeriodSeconds | int | `60` | Amount of time to wait before force-killing the process |
| noop.tolerations | list | `[]` | tolerations are used to allow the pods to be scheduled on nodes with specific taints. An empty list means that the pod does not tolerate any taints and will not be scheduled on nodes with taints. |
| noop.type | object | `{}` | The type of blockchain component. Possible values could be "cl, "consensus-layer, "el, "execution-layer", etc. |
| noop.volumeClaimSpec | object | `{"accessModes":["ReadWriteOnce"],"enabled":false,"resources":{"requests":{"storage":"5Gi"}},"storageClassName":"openebs-hostpath"}` | PersistentVolumeClaimSpec for state cursor |
| noop.volumeClaimSpec.resources.requests.storage | string | `"5Gi"` | The amount of disk space to provision |
| noop.volumeClaimSpec.storageClassName | string | `"openebs-hostpath"` | The storage class to use when provisioning a persistent volume |
| resources.enabled | bool | `false` |  |
| resources.limits.cpu | object | `{}` | Specifies the CPU resource limit for the container. CPU resource limits are measured in units of cores. Examples: "500m" for 0.5 cores, "2" for 2 cores. |
| resources.limits.memory | object | `{}` | Specifies the memory resource limit for the container. Memory resource limits are measured in bytes. Examples: "512Mi" for 512 mebibytes, "2Gi" for 2 gibibytes. |
| resources.requests.cpu | object | `{}` | Specifies the CPU resource request for the container. CPU resource requests are measured in units of cores. Examples: "250m" for 0.25 cores, "1" for 1 core. |
| resources.requests.memory | object | `{}` | Specifies the memory resource request for the container. Memory resource requests are measured in bytes. Examples: "256Mi" for 256 mebibytes, "1Gi" for 1 gibibyte. |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
