{{/*
Expand the name of the chart.
*/}}
{{- define "subgraph_oracle.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "subgraph_oracle.fullname" -}}
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
{{- define "subgraph_oracle.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "subgraph_oracle.labels" -}}
helm.sh/chart: {{ include "subgraph_oracle.chart" . }}
{{ include "subgraph_oracle.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "subgraph_oracle.selectorLabels" -}}
app.kubernetes.io/name: {{ include "subgraph_oracle.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "subgraph_oracle.componentLabelFor" -}}
app.kubernetes.io/component: {{ . }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "subgraph_oracle.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "subgraph_oracle.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}