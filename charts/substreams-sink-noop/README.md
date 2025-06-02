# substreams-sink-noop

![Version: 0.0.3](https://img.shields.io/badge/Version-0.0.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.4.0](https://img.shields.io/badge/AppVersion-v1.4.0-informational?style=flat-square)

A Helm chart for deploying substreams-sink-noop

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy (e.g., Always, IfNotPresent, Never) |
| image.repository | string | `"ghcr.io/streamingfast/substreams-sink-noop"` | Repository for the blockmeta service image |
| image.tag | string | `""` | Overrides the image tag (default: Chart.appVersion) |
| nameOverride | string | `""` |  |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use.    If not set and `create` is true, a name is generated using the fullname template. |
| substreams_sink_noop.config.endpoint | object | `{}` | The endpoint to connect to the network, defaults to mainnet.eth.streamingfast.io:443 |
| substreams_sink_noop.config.manifest | object | `{}` | The URL of the manifest file, defaults to https://github.com/streamingfast/substreams-eth-block-meta/releases/download/v0.4.1/substreams-eth-block-meta-v0.4.1.spkg |
| substreams_sink_noop.config.module | object | `{}` | The name of the module to use from the manifest, defaults to graph_out |
| substreams_sink_noop.extraArgs | object | `{}` | Specify additional command-line arguments to pass to the `tier-1` component. These arguments can be used to override default settings or provide additional configurations that are not covered by the standard configuration options.   |
| substreams_sink_noop.ingress.annotations | object | `{}` |  |
| substreams_sink_noop.ingress.enabled | bool | `false` | Enable or disable ingress |
| substreams_sink_noop.ingress.host | string | `"example.domain.com"` | Hostname for the ingress |
| substreams_sink_noop.ingress.ingressClassName | string | `"nginx"` | Ingress class configuration (K8s 1.19+) |
| substreams_sink_noop.ingress.paths.default | string | `"/"` | Default path mapping for ingress |
| substreams_sink_noop.ingress.tls.enabled | bool | `false` | Enable TLS (HTTPS) for ingress |
| substreams_sink_noop.ingress.tls.secretName | string | `""` | Name of the TLS secret (leave empty for auto-generation) |
| substreams_sink_noop.podSecurityContext | object | `{"runAsNonRoot":false}` | Pod-wide security context settings |
| substreams_sink_noop.podSecurityContext.runAsNonRoot | bool | `false` | Run the pod as a non-root user (recommended for security) |
| substreams_sink_noop.replicaCount | int | `1` | Number of pod replicas for substreams sink noop |
| substreams_sink_noop.resources | object | `{}` | Resource limits and requests for the container (required for HPA to function) |
| substreams_sink_noop.service.ipFamilies | list | `["IPv4"]` | Set the IP families to use (e.g., ["IPv4", "IPv6"]) |
| substreams_sink_noop.service.ipFamilyPolicy | string | `"SingleStack"` | Set the IP family policy for the service Options: - SingleStack (IPv4 or IPv6) - PreferDualStack (Prefers dual-stack but may use single-stack) - RequireDualStack (Must use both IPv4 and IPv6) |
| substreams_sink_noop.service.ports.grpc | int | `8080` | Port for gRPC communication |
| substreams_sink_noop.service.ports.metrics | int | `9102` | Port for metrics |
| substreams_sink_noop.service.type | string | `"ClusterIP"` | Type of Kubernetes service (e.g., ClusterIP, NodePort, LoadBalancer) |
| substreams_sink_noop.serviceMonitor.annotations | object | `{}` | Additional annotations for the ServiceMonitor resource |
| substreams_sink_noop.serviceMonitor.enabled | bool | `false` | Enable or disable the service monitor |
| substreams_sink_noop.serviceMonitor.honorLabels | bool | `false` | Honor labels from scraped metrics |
| substreams_sink_noop.serviceMonitor.interval | string | `"30s"` | Interval at which Prometheus scrapes metrics |
| substreams_sink_noop.serviceMonitor.labels | object | `{}` | Additional labels for the ServiceMonitor resource |
| substreams_sink_noop.serviceMonitor.path | string | `"/metrics"` | Configure metrics path |
| substreams_sink_noop.serviceMonitor.relabelings | list | `[]` | Relabeling configurations for the ServiceMonitor |
| substreams_sink_noop.serviceMonitor.scrapeTimeout | string | `"10s"` | Timeout for the scrape request |
| substreams_sink_noop.terminationGracePeriodSeconds | int | `60` | Grace period for pod termination (in seconds) |
| substreams_sink_noop.volumeClaimSpec | object | `{"accessModes":["ReadWriteOnce"],"enabled":false,"resources":{"requests":{"storage":"1Gi"}},"storageClassName":""}` | PersistentVolumeClaimSpec for state cursor |
| substreams_sink_noop.volumeClaimSpec.resources.requests.storage | string | `"1Gi"` | The amount of disk space to provision |
| substreams_sink_noop.volumeClaimSpec.storageClassName | string | `""` | The storage class to use when provisioning a persistent volume |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
