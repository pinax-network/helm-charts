{{/*
Expand the name of the chart.
*/}}
{{- define "substreams-sink.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}{{- define "substreams-sink.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else if .Values.nameOverride }}
{{- default .Chart.Name .Values.nameOverride }}
{{- else }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "substreams-sink.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create common lablels.
*/}}
{{- define "substreams-sink.common-labels" -}}
app: {{ include "substreams-sink.fullname" . }}
{{- if .Values.sinkType }}
sinkType: {{ .Values.sinkType }}
{{- end }}
{{- if .Values.chain }}
chain: {{ .Values.chain }}
{{- end }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "substreams-sink.labels" -}}
helm.sh/chart: {{ include "substreams-sink.chart" . }}
{{ include "substreams-sink.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "substreams-sink.selectorLabels" -}}
app.kubernetes.io/name: {{ include "substreams-sink.name" . }}
app.kubernetes.io/instance: {{ include "substreams-sink.fullname" . }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "substreams-sink.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "substreams-sink.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
