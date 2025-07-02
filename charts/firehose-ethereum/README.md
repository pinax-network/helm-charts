# firehose-ethereum

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v2.11.13-geth](https://img.shields.io/badge/AppVersion-v2.11.13--geth-informational?style=flat-square)

A Helm chart for Kubernetes

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| chunkMode.chunkConfig.startBlock | int | `0` | Starting block number (inclusive) |
| chunkMode.chunkConfig.stopBlock | int | `100000` | Ending block number (exclusive) |
| chunkMode.chunkConfig.workers | int | `4` | Number of workers to split block range across |
| chunkMode.components.merger.config | object | `{"merger-delete-threads":100,"merger-time-between-store-lookups":"10s"}` | Merger node configuration |
| chunkMode.components.merger.enabled | bool | `true` | Enable the Firehose merger node |
| chunkMode.components.reader.config | object | `{"reader-node-blocks-chan-capacity":5000,"reader-node-firehose-plaintext":true,"reader-node-one-block-suffix":"x37","reader-node-readiness-max-latency":"1200s"}` | Reader node configuration |
| chunkMode.components.reader.enabled | bool | `true` | Enable the Firehose reader node |
| chunkMode.components.remoteFirehose.endpoint | string | `"https://firehose.example.com/ethereum"` | Firehose endpoint to fetch processed block data |
| chunkMode.components.rpcPoller.endpoint | string | `"https://mainnet.infura.io/v3/YOUR_INFURA_PROJECT_ID"` | RPC endpoint to poll for blocks |
| chunkMode.method | string | `"firehose"` | Mode to use in chunk processing Options:   - "firehose": Remote firehose for block data   - "poller": Remote rpc for block data |
| chunkMode.storage | object | `{"readerNode":{"size":"50Mi"},"storageClass":""}` | Storage configuration for full mode |
| commonConfig.common-auth-plugin | string | `""` |  |
| commonConfig.common-auto-mem-limit-percent | int | `90` |  |
| commonConfig.common-forked-blocks-store-url | string | `""` |  |
| commonConfig.common-index-block-sizes | int | `10000` |  |
| commonConfig.common-merged-blocks-store-url | string | `""` |  |
| commonConfig.common-metering-plugin | string | `""` |  |
| commonConfig.common-one-block-store-url | string | `""` |  |
| commonConfig.common-system-shutdown-signal-delay | string | `"10s"` |  |
| fullMode.components.grpc.config.advertise-chain-name | string | `"mainnet"` | gRPC server arguments |
| fullMode.components.grpc.config.firehose-rate-limit-bucket-fill-rate | string | `"2s"` |  |
| fullMode.components.grpc.config.firehose-rate-limit-bucket-size | int | `10` |  |
| fullMode.components.grpc.enabled | bool | `true` | Enable the Firehose gRPC server |
| fullMode.components.grpc.ingress | object | `{"annotations":{},"enabled":false,"host":"firehose.example.com","ingressClassName":""}` | gRPC server configuration |
| fullMode.components.grpc.replicas | int | `1` | Number of replicas for the gRPC server |
| fullMode.components.indexer.config.log-to-file | bool | `false` | Indexer arguments |
| fullMode.components.indexer.enabled | bool | `true` | Enable the Firehose indexer node |
| fullMode.components.indexer.replicas | int | `1` | Number of replicas for the relayer node |
| fullMode.components.lighthouse.checkpointSyncUrl | string | `"https://sync-mainnet.beaconcha.in"` | Checkpoint sync URL for faster initial sync |
| fullMode.components.lighthouse.enabled | bool | `true` | Enable Lighthouse for beacon chain synchronization |
| fullMode.components.lighthouse.network | string | `"mainnet"` | Ethereum network (mainnet, goerli, sepolia, holesky) |
| fullMode.components.lighthouse.pruneBlobs | bool | `true` | Remove old blob data to save space (recommended for non-archive nodes) |
| fullMode.components.merger.config.merger-delete-threads | int | `100` |  |
| fullMode.components.merger.config.merger-time-between-store-lookups | string | `"10s"` | Merger node arguments |
| fullMode.components.merger.enabled | bool | `true` | Enable the Firehose merger node |
| fullMode.components.merger.replicas | int | `1` | Number of replicas for the merger node |
| fullMode.components.reader.config.reader-node-arguments | string | `"--networkid=1 --ipcpath={data-dir}/reader/ipc --port=30302 --http --http.api=eth,net,web3 --http.port=8545 --http.addr=0.0.0.0 --http.vhosts=* --authrpc.port=8551 --authrpc.addr=0.0.0.0 --authrpc.vhosts=* --authrpc.jwtsecret=/jwt/jwt.hex --cache=8192 --syncmode=full --vmtrace=firehose"` |  |
| fullMode.components.reader.config.reader-node-blocks-chan-capacity | int | `5000` |  |
| fullMode.components.reader.config.reader-node-firehose-plaintext | bool | `true` |  |
| fullMode.components.reader.config.reader-node-one-block-suffix | string | `"x37"` |  |
| fullMode.components.reader.config.reader-node-path | string | `"/app/geth"` | Execution binary path |
| fullMode.components.reader.config.reader-node-readiness-max-latency | string | `"1200s"` |  |
| fullMode.components.reader.enabled | bool | `true` | Enable the Firehose reader node |
| fullMode.components.reader.replicas | int | `1` | Number of replicas for the reader node |
| fullMode.components.relayer.config.relayer-max-source-latency | string | `"1h"` | Relayer node arguments |
| fullMode.components.relayer.enabled | bool | `true` | Enable the Firehose relayer node |
| fullMode.components.relayer.replicas | int | `1` | Number of replicas for the relayer node |
| fullMode.storage | object | `{"lighthouse":{"size":"400Gi"},"readerNode":{"size":"4Ti"},"storageClass":""}` | Storage configuration for full mode |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/streamingfast/firehose-ethereum"` | Image for Firehose |
| image.tag | string | Chart.appVersion | Overrides the image tag |
| imagePullSecrets | list | `[]` | Pull secrets required to fetch the Image |
| mode | string | `"full"` | Firehose operating mode Options:   - "full": Complete Firehose stack with all components (reader, merger, relayer, etc.)   - "chunk": Lightweight mode for specific block ranges |
| nameOverride | string | `""` |  |
| s3CredentialsSecret | list | `[]` | Secret name containing S3/object storage credentials. Must contain keys: access-key, secret-key |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
