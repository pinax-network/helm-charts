# blockmeta

![Version: 4.3.0](https://img.shields.io/badge/Version-4.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v2.3.0](https://img.shields.io/badge/AppVersion-v2.3.0-informational?style=flat-square)

A Helm chart for Kubernetes

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| alertManager.critBlockTime | int | `90` | Threshold in seconds for triggering a critical alert for head block time drift |
| alertManager.enabled | bool | `false` | Set to true if AlertManager integration is enabled |
| alertManager.namespace | object | `{}` | The namespace where head_block_time_drift metrics are collected |
| alertManager.warnBlockTime | int | `30` | Threshold in seconds for triggering a warning alert for head block time drift |
| auth.url | string | `""` |  |
| blockChain.blocksVersion | object | `{}` | The version of the blocks. Specify the version you are using, e.g., "1.0.0", "2.1.3", "v1", etc. |
| blockChain.network | object | `{}` | The name of the blockchain network. Possible values could be "mainnet", "testnet", "devnet", etc. |
| blockChain.type | object | `{}` | The type of blockchain component. Possible values could be "cl, "consensus-layer, "el, "execution-layer", etc. |
| fullnameOverride | object | `{}` | Overrides the full name of the chart. If not set, the full name will be derived from the release name and the chart name. |
| image.service.pullPolicy | string | `"IfNotPresent"` | The pull policy for the Docker image. Valid options are "Always", "IfNotPresent", and "Never". |
| image.service.repository | string | `"ghcr.io/streamingfast/blockmeta-service"` | The repository where the Docker image is located. |
| image.service.tag | string | `"2f971e0"` | The tag for the Docker image. If not set, the default tag will be used. |
| image.sink.pullPolicy | string | `"IfNotPresent"` | The pull policy for the Docker image. Valid options are "Always", "IfNotPresent", and "Never". |
| image.sink.repository | string | `"ghcr.io/streamingfast/substreams-sink-kv"` | The repository where the Docker image is located. |
| image.sink.tag | string | `"v2.3.0"` | The tag for the Docker image. If not set, the default tag will be used. |
| inject.affinity | object | `{}` | Affinity rules for pod scheduling. Defines rules for preferred or required node and pod selection. Example: affinity:   nodeAffinity:     requiredDuringSchedulingIgnoredDuringExecution:       nodeSelectorTerms:         - matchExpressions:             - key: "key1"               operator: "In"               values:                 - "value1" |
| inject.autoscaling.enabled | bool | `false` | Specifies whether the Horizontal Pod Autoscaler is enabled |
| inject.autoscaling.maxReplicas | int | `5` | Specifies the maximum number of replicas that the autoscaler can scale up to. |
| inject.autoscaling.minReplicas | int | `1` | Specifies the minimum number of replicas that the autoscaler can scale down to. |
| inject.autoscaling.targetCPUUtilizationPercentage | int | `80` | Specifies the target average CPU utilization (represented as a percentage of requested CPU) across all replicas. The autoscaler will adjust the number of replicas to maintain this average utilization. |
| inject.autoscaling.targetMemoryUtilizationPercentage | int | `80` | Specifies the target average memory utilization (represented as a percentage of requested memory) across all replicas. The autoscaler will adjust the number of replicas to maintain this average utilization. |
| inject.env | object | `{}` | Define custom aliases for preconfigured commands in your environment. This allows you to create shorthand commands for frequently used operations, enhancing efficiency and reducing the need for repetitive typing. |
| inject.extraArgs | object | `{}` | Specify additional command-line arguments to pass to the `tier-2` component. These arguments can be used to override default settings or provide additional configurations that are not covered by the standard configuration options. |
| inject.imagePullSecrets | list | `[]` | Pull secrets required to fetch the Image |
| inject.nodeSelector | object | `{}` | Node selection constraints for pod scheduling. Allows you to specify a map of key-value pairs to target specific nodes. |
| inject.podAnnotations | object | `{}` | Annotations for the `Pod` |
| inject.podSecurityContext | object | `{}` | Pod-wide security context |
| inject.resources | object | `{}` |  |
| inject.resources.enabled | bool | `false` |  |
| inject.resources.limits.cpu | object | `{}` | Specifies the CPU resource limit for the container. CPU resource limits are measured in units of cores. Examples: "500m" for 0.5 cores, "2" for 2 cores. |
| inject.resources.limits.memory | object | `{}` | Specifies the memory resource limit for the container. Memory resource limits are measured in bytes. Examples: "512Mi" for 512 mebibytes, "2Gi" for 2 gibibytes. |
| inject.resources.requests.cpu | object | `{}` | Specifies the CPU resource request for the container. CPU resource requests are measured in units of cores. Examples: "250m" for 0.25 cores, "1" for 1 core. |
| inject.resources.requests.memory | object | `{}` | Specifies the memory resource request for the container. Memory resource requests are measured in bytes. Examples: "256Mi" for 256 mebibytes, "1Gi" for 1 gibibyte. |
| inject.service.clusterIP | object | `{}` | Specifies the cluster IP address of the service. If not specified, a cluster IP will be automatically assigned. |
| inject.service.ipFamilyPolicy | object | `{}` | Specifies the IP family policy for the service. Valid options are "SingleStack", "PreferDualStack", and "RequireDualStack". |
| inject.service.ports.metrics | int | `9102` | Specifies the port for the metrics interface. This port will be exposed by the service. |
| inject.service.type | string | `"ClusterIP"` | Specifies the type of the Kubernetes service. Valid options are "ClusterIP", "NodePort", "LoadBalancer", and "ExternalName". |
| inject.serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| inject.serviceAccount.create | bool | `false` | Specifies whether a service account should be created |
| inject.serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| inject.serviceMonitor.enabled | bool | `false` | Enable or disable the service monitor |
| inject.serviceMonitor.interval | string | `"30s"` | Interval at which Prometheus scrapes metrics |
| inject.serviceMonitor.scrapeTimeout | string | `"10s"` | Timeout for the scrape request |
| inject.terminationGracePeriodSeconds | int | `10` | Amount of time to wait before force-killing the process |
| inject.tolerations | object | `{}` | Tolerations for pod scheduling. Allows the pod to be scheduled on nodes with matching taints. Example: tolerations:   - key: "key1"     operator: "Exists"     effect: "NoSchedule" |
| metering.url | string | `""` |  |
| nameOverride | object | `{}` | Overrides the name of the chart. If not set, the name will be derived from the chart name. |
| server.affinity | object | `{}` | Affinity rules for pod scheduling. Defines rules for preferred or required node and pod selection. Example: affinity:   nodeAffinity:     requiredDuringSchedulingIgnoredDuringExecution:       nodeSelectorTerms:         - matchExpressions:             - key: "key1"               operator: "In"               values:                 - "value1" |
| server.autoscaling.enabled | bool | `false` | Specifies whether the Horizontal Pod Autoscaler is enabled |
| server.autoscaling.maxReplicas | int | `5` | Specifies the maximum number of replicas that the autoscaler can scale up to. |
| server.autoscaling.minReplicas | int | `1` | Specifies the minimum number of replicas that the autoscaler can scale down to. |
| server.autoscaling.targetCPUUtilizationPercentage | int | `80` | Specifies the target average CPU utilization (represented as a percentage of requested CPU) across all replicas. The autoscaler will adjust the number of replicas to maintain this average utilization. |
| server.autoscaling.targetMemoryUtilizationPercentage | int | `80` | Specifies the target average memory utilization (represented as a percentage of requested memory) across all replicas. The autoscaler will adjust the number of replicas to maintain this average utilization. |
| server.env | object | `{}` | Define custom aliases for preconfigured commands in your environment. This allows you to create shorthand commands for frequently used operations, enhancing efficiency and reducing the need for repetitive typing. |
| server.extraArgs | object | `{}` | Specify additional command-line arguments to pass to the `tier-2` component. These arguments can be used to override default settings or provide additional configurations that are not covered by the standard configuration options. |
| server.imagePullSecrets | list | `[]` | Pull secrets required to fetch the Image |
| server.ingress.annotations | object | `{}` |  |
| server.ingress.enabled | bool | `true` |  |
| server.ingress.host | string | `"example.domain.com"` |  |
| server.ingress.ingressClassName | string | `"nginx"` |  |
| server.ingress.paths.default | string | `"/"` |  |
| server.ingress.tls.enabled | bool | `false` |  |
| server.ingress.tls.secretName | string | `""` |  |
| server.nodeSelector | object | `{}` | Node selection constraints for pod scheduling. Allows you to specify a map of key-value pairs to target specific nodes. |
| server.podAnnotations | object | `{}` | Annotations for the `Pod` |
| server.podSecurityContext | object | `{}` | Pod-wide security context |
| server.resources | object | `{}` |  |
| server.resources.enabled | bool | `false` |  |
| server.resources.limits.cpu | object | `{}` | Specifies the CPU resource limit for the container. CPU resource limits are measured in units of cores. Examples: "500m" for 0.5 cores, "2" for 2 cores. |
| server.resources.limits.memory | object | `{}` | Specifies the memory resource limit for the container. Memory resource limits are measured in bytes. Examples: "512Mi" for 512 mebibytes, "2Gi" for 2 gibibytes. |
| server.resources.requests.cpu | object | `{}` | Specifies the CPU resource request for the container. CPU resource requests are measured in units of cores. Examples: "250m" for 0.25 cores, "1" for 1 core. |
| server.resources.requests.memory | object | `{}` | Specifies the memory resource request for the container. Memory resource requests are measured in bytes. Examples: "256Mi" for 256 mebibytes, "1Gi" for 1 gibibyte. |
| server.service.clusterIP | object | `{}` | Specifies the cluster IP address of the service. If not specified, a cluster IP will be automatically assigned. |
| server.service.ipFamilyPolicy | object | `{}` | Specifies the IP family policy for the service. Valid options are "SingleStack", "PreferDualStack", and "RequireDualStack". |
| server.service.ports.grpc | int | `50051` | Specifies the port for the blockmeta service GRPC interface. This port will be exposed by the service. |
| server.service.type | string | `"ClusterIP"` | Specifies the type of the Kubernetes service. Valid options are "ClusterIP", "NodePort", "LoadBalancer", and "ExternalName". |
| server.serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| server.serviceAccount.create | bool | `false` | Specifies whether a service account should be created |
| server.serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| server.terminationGracePeriodSeconds | int | `10` | Amount of time to wait before force-killing the process |
| server.tolerations | object | `{}` | Tolerations for pod scheduling. Allows the pod to be scheduled on nodes with matching taints. Example: tolerations:   - key: "key1"     operator: "Exists"     effect: "NoSchedule" |
| sink.affinity | object | `{}` | Affinity rules for pod scheduling. Defines rules for preferred or required node and pod selection. Example: affinity:   nodeAffinity:     requiredDuringSchedulingIgnoredDuringExecution:       nodeSelectorTerms:         - matchExpressions:             - key: "key1"               operator: "In"               values:                 - "value1" |
| sink.autoscaling.enabled | bool | `false` | Specifies whether the Horizontal Pod Autoscaler is enabled |
| sink.autoscaling.maxReplicas | int | `5` | Specifies the maximum number of replicas that the autoscaler can scale up to. |
| sink.autoscaling.minReplicas | int | `1` | Specifies the minimum number of replicas that the autoscaler can scale down to. |
| sink.autoscaling.targetCPUUtilizationPercentage | int | `80` | Specifies the target average CPU utilization (represented as a percentage of requested CPU) across all replicas. The autoscaler will adjust the number of replicas to maintain this average utilization. |
| sink.autoscaling.targetMemoryUtilizationPercentage | int | `80` | Specifies the target average memory utilization (represented as a percentage of requested memory) across all replicas. The autoscaler will adjust the number of replicas to maintain this average utilization. |
| sink.env | object | `{}` | Define custom aliases for preconfigured commands in your environment. This allows you to create shorthand commands for frequently used operations, enhancing efficiency and reducing the need for repetitive typing. |
| sink.extraArgs | object | `{}` | Specify additional command-line arguments to pass to the `tier-2` component. These arguments can be used to override default settings or provide additional configurations that are not covered by the standard configuration options. |
| sink.imagePullSecrets | list | `[]` | Pull secrets required to fetch the Image |
| sink.nodeSelector | object | `{}` | Node selection constraints for pod scheduling. Allows you to specify a map of key-value pairs to target specific nodes. |
| sink.podAnnotations | object | `{}` | Annotations for the `Pod` |
| sink.podSecurityContext | object | `{}` | Pod-wide security context |
| sink.resources | object | `{}` |  |
| sink.resources.enabled | bool | `false` |  |
| sink.resources.limits.cpu | object | `{}` | Specifies the CPU resource limit for the container. CPU resource limits are measured in units of cores. Examples: "500m" for 0.5 cores, "2" for 2 cores. |
| sink.resources.limits.memory | object | `{}` | Specifies the memory resource limit for the container. Memory resource limits are measured in bytes. Examples: "512Mi" for 512 mebibytes, "2Gi" for 2 gibibytes. |
| sink.resources.requests.cpu | object | `{}` | Specifies the CPU resource request for the container. CPU resource requests are measured in units of cores. Examples: "250m" for 0.25 cores, "1" for 1 core. |
| sink.resources.requests.memory | object | `{}` | Specifies the memory resource request for the container. Memory resource requests are measured in bytes. Examples: "256Mi" for 256 mebibytes, "1Gi" for 1 gibibyte. |
| sink.service.clusterIP | object | `{}` | Specifies the cluster IP address of the service. If not specified, a cluster IP will be automatically assigned. |
| sink.service.ipFamilyPolicy | object | `{}` | Specifies the IP family policy for the service. Valid options are "SingleStack", "PreferDualStack", and "RequireDualStack". |
| sink.service.ports.grpc | int | `9000` | Specifies the port for the sink GRPC interface. This port will be exposed by the service. |
| sink.service.type | string | `"ClusterIP"` | Specifies the type of the Kubernetes service. Valid options are "ClusterIP", "NodePort", "LoadBalancer", and "ExternalName". |
| sink.serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| sink.serviceAccount.create | bool | `false` | Specifies whether a service account should be created |
| sink.serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| sink.terminationGracePeriodSeconds | int | `10` | Amount of time to wait before force-killing the process |
| sink.tolerations | object | `{}` | Tolerations for pod scheduling. Allows the pod to be scheduled on nodes with matching taints. Example: tolerations:   - key: "key1"     operator: "Exists"     effect: "NoSchedule" |
| spkg.url | string | `""` |  |
| substreams_tier1.url | string | `""` |  |
| tikv.url | string | `""` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
