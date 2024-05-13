{{/*
Expand the name of the chart.
This template returns the chart name, either using the default .Chart.Name or an override .Values.nameOverride.
It truncates the result to 63 characters and removes any trailing hyphens.
*/}}
{{- define "substreams.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If the release name contains the chart name, it will be used as a full name. Otherwise, it combines the release name and the chart name.
*/}}
{{- define "substreams.fullname" -}}
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
This combines the chart name and version, replaces any '+' with '_', truncates to 63 characters, and removes trailing hyphens.
*/}}
{{- define "substreams-tier-2.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
This template includes the chart label and version, selector labels, app version if available, and managed-by label.
*/}}
{{- define "substreams.labels" -}}
helm.sh/chart: {{ include "substreams-tier-2.chart" . }}
{{ include "substreams.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
This template provides standard selector labels including the app name and instance.
*/}}
{{- define "substreams.selectorLabels" -}}
app.kubernetes.io/name: {{ include "substreams.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
This selects the service account name based on whether it is created and any overrides.
*/}}
{{- define "substreams.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "substreams.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create a label for a component
This template is used to add a component label to Kubernetes resources.
*/}}
{{- define "substreams.componentLabelFor" -}}
app.kubernetes.io/component: {{ . }}
{{- end }}