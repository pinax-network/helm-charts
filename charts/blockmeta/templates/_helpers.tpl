{{/*
Expand the name of the chart.
*/}}
{{- define "blockmeta.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "blockmeta.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "blockmeta.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "blockmeta.labels" -}}
helm.sh/chart: {{ include "blockmeta.chart" . }}
{{ include "blockmeta.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "blockmeta.selectorLabels" -}}
app.kubernetes.io/name: {{ include "blockmeta.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "blockmeta.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "blockmeta.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}


{{/*
Create a label for a component
This template is used to add a component label to Kubernetes resources.
*/}}
{{- define "blockmeta.componentLabelFor" -}}
app.kubernetes.io/component: {{ . }}
{{- end }}

{{/*
Generate a unique name for resources based on blockchain network and chain version.
*/}}
{{- define "server.uniqueName" -}}
{{- printf "%s-server-blockmeta-%s" (required "blockchain network is required" .Values.blockChain.network) (required "blockchain chainVersion is required" .Values.blockChain.blocksVersion) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Generate a unique name for resources based on blockchain network and chain version.
*/}}
{{- define "sink.uniqueName" -}}
{{- printf "%s-sink-blockmeta-%s" (required "blockchain network is required" .Values.blockChain.network) (required "blockchain chainVersion is required" .Values.blockChain.blocksVersion) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Generate a unique name for resources based on blockchain network and chain version.
*/}}
{{- define "inject.uniqueName" -}}
{{- printf "%s-inject-blockmeta-%s" (required "blockchain network is required" .Values.blockChain.network) (required "blockchain chainVersion is required" .Values.blockChain.blocksVersion) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the name of the service account to use.
This selects the service account name based on the blockchain network and chain version.
*/}}
{{- define "server.serviceAccountName" -}}
{{- printf "%s-server-blockmeta-%s" (required "blockchain network is required" .Values.blockChain.network) (required "blockchain chainVersion is required" .Values.blockChain.blocksVersion) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the name of the service account to use.
This selects the service account name based on the blockchain network and chain version.
*/}}
{{- define "inject.serviceAccountName" -}}
{{- printf "%s-inject-blockmeta-%s" (required "blockchain network is required" .Values.blockChain.network) (required "blockchain chainVersion is required" .Values.blockChain.blocksVersion) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the name of the service account to use.
This selects the service account name based on the blockchain network and chain version.
*/}}
{{- define "sink.serviceAccountName" -}}
{{- printf "%s-sink-blockmeta-%s" (required "blockchain network is required" .Values.blockChain.network) (required "blockchain chainVersion is required" .Values.blockChain.blocksVersion) | trunc 63 | trimSuffix "-" }}
{{- end }}