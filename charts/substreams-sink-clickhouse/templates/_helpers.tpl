{{/*
Expand the name of the chart.
*/}}
{{- define "substreams-sink-clickhouse.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "substreams-sink-clickhouse.fullname" -}}
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
{{- define "substreams-sink-clickhouse.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "substreams-sink-clickhouse.labels" -}}
helm.sh/chart: {{ include "substreams-sink-clickhouse.chart" . }}
{{ include "substreams-sink-clickhouse.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "substreams-sink-clickhouse.selectorLabels" -}}
app.kubernetes.io/name: {{ include "substreams-sink-clickhouse.name" . }}
app.kubernetes.io/instance: {{ include "substreams-sink-clickhouse.fullname" . }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "substreams-sink-clickhouse.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "substreams-sink-clickhouse.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
