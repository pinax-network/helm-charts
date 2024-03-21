{{/*
Expand the name of the chart.
*/}}
{{- define "blockmeta_server.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "blockmeta_sink_serve.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "blockmeta_sink_inject.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "blockmeta_server.fullname" -}}
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

{{- define "blockmeta_sink_serve.fullname" -}}
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

{{- define "blockmeta_sink_inject.fullname" -}}
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
{{- define "blockmeta_server.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "blockmeta_sink_serve.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "blockmeta_sink_inject.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "blockmeta_server.labels" -}}
helm.sh/chart: {{ include "blockmeta_server.chart" . }}
{{ include "blockmeta_server.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "blockmeta_sink_serve.labels" -}}
helm.sh/chart: {{ include "blockmeta_sink_serve.chart" . }}
{{ include "blockmeta_sink_serve.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "blockmeta_sink_inject.labels" -}}
helm.sh/chart: {{ include "blockmeta_sink_inject.chart" . }}
{{ include "blockmeta_sink_inject.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "blockmeta_server.selectorLabels" -}}
app.kubernetes.io/name: {{ include "blockmeta_server.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "blockmeta_sink_serve.selectorLabels" -}}
app.kubernetes.io/name: {{ include "blockmeta_sink_serve.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "blockmeta_sink_inject.selectorLabels" -}}
app.kubernetes.io/name: {{ include "blockmeta_sink_inject.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "blockmeta_server.componentLabelFor" -}}
app.kubernetes.io/component: {{ . }}
{{- end }}

{{- define "blockmeta_sink_serve.componentLabelFor" -}}
app.kubernetes.io/component: {{ . }}
{{- end }}

{{- define "blockmeta_sink_inject.componentLabelFor" -}}
app.kubernetes.io/component: {{ . }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "blockmeta_server.serviceAccountName" -}}
{{- if .Values.blockmeta.server.serviceAccount.create }}
{{- default (printf "%s-%s" (include "blockmeta_server.fullname" .) .Release.Namespace) .Values.blockmeta.server.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.blockmeta.server.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "blockmeta_sink_serve.serviceAccountName" -}}
{{- if .Values.blockmeta.sink.serve.serviceAccount.create }}
{{- default (printf "%s-%s" (include "blockmeta_sink_serve.fullname" .) .Release.Namespace) .Values.blockmeta.sink.serve.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.blockmeta.sink.serve.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "blockmeta_sink_inject.serviceAccountName" -}}
{{- if .Values.blockmeta.sink.inject.serviceAccount.create }}
{{- default (printf "%s-%s" (include "blockmeta_sink_inject.fullname" .) .Release.Namespace) .Values.blockmeta.sink.inject.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.blockmeta.sink.inject.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "blockmeta_server.replicas" -}}
{{ default 1 .replicaCount }}
{{- end }}

{{- define "blockmeta_sink_serve.replicas" -}}
{{ default 1 .replicaCount }}
{{- end }}

{{- define "blockmeta_sink_inject.replicas" -}}
{{ default 1 .replicaCount }}
{{- end }}

{{- define "blockmeta_sink_serve.componentName" -}}
{{- printf "blockmeta-sink-serve" -}}
{{- end }}

