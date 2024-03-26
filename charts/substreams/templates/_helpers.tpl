{{/*
Expand the name of the chart.
*/}}
{{- define "substreams.name" -}}
{{- default .Chart.Name .Values.tier_1.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "substreams.fullname" -}}
{{- if .Values.tier_1.fullnameOverride }}
{{- .Values.tier_1.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.tier_1.nameOverride }}
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
{{- define "substreams.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "substreams.labels" -}}
helm.sh/chart: {{ include "substreams.chart" . }}
{{ include "substreams.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "substreams.selectorLabels" -}}
app.kubernetes.io/name: {{ include "substreams.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}



{{- define "substreams.componentLabelFor" -}}
app.kubernetes.io/component: {{ . }}
{{- end }}