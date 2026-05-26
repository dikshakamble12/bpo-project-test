{{/*
Expand the name of the chart.
*/}}
{{- define "microshield-bpo-site.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "microshield-bpo-site.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Chart name and version.
*/}}
{{- define "microshield-bpo-site.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels.
*/}}
{{- define "microshield-bpo-site.labels" -}}
helm.sh/chart: {{ include "microshield-bpo-site.chart" . }}
{{ include "microshield-bpo-site.selectorLabels" . }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels.
*/}}
{{- define "microshield-bpo-site.selectorLabels" -}}
app.kubernetes.io/name: {{ include "microshield-bpo-site.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Target namespace for namespaced resources.
*/}}
{{- define "microshield-bpo-site.namespace" -}}
{{- default .Release.Namespace .Values.namespace.name -}}
{{- end -}}

{{/*
Secret name.
*/}}
{{- define "microshield-bpo-site.secretName" -}}
{{- default (printf "%s-secret" (include "microshield-bpo-site.fullname" .)) .Values.secret.name -}}
{{- end -}}
