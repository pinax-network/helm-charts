# substreams-tier-1

![Version: 4.5.0](https://img.shields.io/badge/Version-4.5.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.9.1](https://img.shields.io/badge/AppVersion-v1.9.1-informational?style=flat-square)

A Helm chart for Kubernetes

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| alertManager.critBlockTime | int | `90` | Threshold in seconds for triggering a critical alert for head block time drift |
| alertManager.enabled | bool | `false` | Set to true if AlertManager integration is enabled |
| alertManager.namespace | object | `{}` | The namespace where head_block_time_drift metrics are collected |
| alertManager.warnBlockTime | int | `30` | Threshold in seconds for triggering a warning alert for head block time drift |
| blockChain.blocksVersion | object | `{}` | The version of the blocks. Specify the version you are using, e.g., "1.0.0", "2.1.3", "v1", etc. |
| blockChain.network | object | `{}` | The name of the blockchain network. Possible values could be "mainnet", "testnet", "devnet", etc. |
| blockChain.type | object | `{}` | The type of blockchain component. Possible values could be "cl, "consensus-layer, "el, "execution-layer", etc. |
| fullnameOverride | string | `""` | Overrides the full name of the chart. If not set, the full name will be derived from the release name and the chart name. |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.host | string | `"example.domain.com"` |  |
| ingress.ingressClassName | string | `"nginx"` |  |
| ingress.paths.default | string | `"/"` |  |
| ingress.tls.enabled | bool | `false` |  |
| ingress.tls.secretName | string | `""` |  |
| nameOverride | string | `""` | Overrides the name of the chart. If not set, the name will be derived from the chart name. |
| resources.enabled | bool | `false` |  |
| resources.limits.cpu | object | `{}` | Specifies the CPU resource limit for the container. CPU resource limits are measured in units of cores. Examples: "500m" for 0.5 cores, "2" for 2 cores. |
| resources.limits.memory | object | `{}` | Specifies the memory resource limit for the container. Memory resource limits are measured in bytes. Examples: "512Mi" for 512 mebibytes, "2Gi" for 2 gibibytes. |
| resources.requests.cpu | object | `{}` | Specifies the CPU resource request for the container. CPU resource requests are measured in units of cores. Examples: "250m" for 0.25 cores, "1" for 1 core. |
| resources.requests.memory | object | `{}` | Specifies the memory resource request for the container. Memory resource requests are measured in bytes. Examples: "256Mi" for 256 mebibytes, "1Gi" for 1 gibibyte. |
| selectedImage | string | `"firehoseCore"` |  |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| substreams.affinity | object | `{}` | Affinity rules for pod scheduling. Defines rules for preferred or required node and pod selection. Example: affinity:   nodeAffinity:     requiredDuringSchedulingIgnoredDuringExecution:       nodeSelectorTerms:         - matchExpressions:             - key: "key1"               operator: "In"               values:                 - "value1" |
| substreams.autoscaling.enabled | bool | `true` | Specifies whether the Horizontal Pod Autoscaler is enabled |
| substreams.autoscaling.maxReplicas | int | `5` | Specifies the maximum number of replicas that the autoscaler can scale up to. |
| substreams.autoscaling.minReplicas | int | `1` | Specifies the minimum number of replicas that the autoscaler can scale down to. |
| substreams.autoscaling.targetCPUUtilizationPercentage | int | `80` | Specifies the target average CPU utilization (represented as a percentage of requested CPU) across all replicas. The autoscaler will adjust the number of replicas to maintain this average utilization. |
| substreams.autoscaling.targetMemoryUtilizationPercentage | int | `80` | Specifies the target average memory utilization (represented as a percentage of requested memory) across all replicas. The autoscaler will adjust the number of replicas to maintain this average utilization. |
| substreams.config | string | `"# -- Sets the verbosity level of the logging. 0 means least verbose.\nlog-verbosity: 0\n\n# -- Determines if logs should be written to a file. If false, logs will be written to stdout.\nlog-to-file: false\n\n# -- Sets the chain advertised name.\nadvertise-chain-name: {}\n\n# -- Sorts the internal config to a value YAML-formatted string. .i.e. \"s1\", \"s2\", \"s3\"\nsubstreams-state-store-default-tag: {}\n\n# -- Configuration for the common authentication plugin.\ncommon-auth-plugin: {}\n\n# -- Configuration for the common metering plugin.\ncommon-metering-plugin: {}\n\n# -- Address for live block data.\ncommon-live-blocks-addr: {}\n\n# -- URL for the merged blocks store.\ncommon-merged-blocks-store-url: {}\n\n# -- URL for the one block store.\ncommon-one-block-store-url: {}\n\n# -- URL for the forked blocks store.\ncommon-forked-blocks-store-url: {}\n\n# -- Delay before shutting down the system after a shutdown signal is received.\ncommon-system-shutdown-signal-delay: 10s\n\n# -- Percentage of memory limit that should trigger auto memory management.\ncommon-auto-mem-limit-percent: 90\n\n# -- RPC endpoints for Substreams.\nsubstreams-rpc-endpoints: {}\n\n# -- URL for the Substreams state store.\nsubstreams-state-store-url: {}\n\n# -- Address for the Substreams Tier 1 gRPC listener.\nsubstreams-tier1-grpc-listen-addr: :9000\n\n# -- Temporary directory for cache files.\ncommon-tmp-dir: /tmp\n\n# -- Endpoint for Substreams Tier 1 subrequests.\nsubstreams-tier1-subrequests-endpoint: {}\n"` | Configuration for the Substreams component. |
| substreams.env | object | `{}` | Define custom aliases for preconfigured commands in your environment. This allows you to create shorthand commands for frequently used operations, enhancing efficiency and reducing the need for repetitive typing. |
| substreams.extraArgs | object | `{}` | Specify additional command-line arguments to pass to the `tier-2` component. These arguments can be used to override default settings or provide additional configurations that are not covered by the standard configuration options. |
| substreams.imagePullSecrets | object | `{}` | Pull secrets required to fetch the Image |
| substreams.nodeSelector | object | `{}` | Node selection constraints for pod scheduling. Allows you to specify a map of key-value pairs to target specific nodes. |
| substreams.podAnnotations | object | `{}` | Annotations for the `Pod` |
| substreams.podSecurityContext | object | `{}` | Pod-wide security context |
| substreams.resources | object | `{}` |  |
| substreams.service.clusterIP | object | `{}` | Specifies the cluster IP address of the service. If not specified, a cluster IP will be automatically assigned. |
| substreams.service.ipFamilyPolicy | object | `{}` | Specifies the IP family policy for the service. Valid options are "SingleStack", "PreferDualStack", and "RequireDualStack". |
| substreams.service.ports.grpc | int | `9000` | Specifies the port for the Substreams GRPC interface. This port will be exposed by the service. |
| substreams.service.ports.metrics | int | `9102` | Specifies the port for the metrics interface. This port will be exposed by the service. |
| substreams.service.type | string | `"ClusterIP"` | Specifies the type of the Kubernetes service. Valid options are "ClusterIP", "NodePort", "LoadBalancer", and "ExternalName". |
| substreams.serviceMonitor.enabled | bool | `true` | Enable or disable the service monitor |
| substreams.serviceMonitor.interval | string | `"30s"` | Interval at which Prometheus scrapes metrics |
| substreams.serviceMonitor.scrapeTimeout | string | `"10s"` | Timeout for the scrape request |
| substreams.terminationGracePeriodSeconds | int | `10` | Amount of time to wait before force-killing the process |
| substreams.tolerations | object | `{}` | Tolerations for pod scheduling. Allows the pod to be scheduled on nodes with matching taints. Example: tolerations:   - key: "key1"     operator: "Exists"     effect: "NoSchedule" |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
