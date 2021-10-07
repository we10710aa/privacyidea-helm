{{/*
Expand the name of the chart.
*/}}
{{- define "privacyidea.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "privacyidea.fullname" -}}
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
{{- define "privacyidea.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "privacyidea.labels" -}}
helm.sh/chart: {{ include "privacyidea.chart" . }}
{{ include "privacyidea.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "privacyidea.selectorLabels" -}}
app.kubernetes.io/name: {{ include "privacyidea.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "privacyidea.mysql" -}}
  {{- printf "%s-mysql" (include "privacyidea.fullname" .) -}}
{{- end -}}

{{- define "privacyidea.mysql.realPassword" -}}
  {{required "mysql.password must be provided" .Values.mysql.password}}
{{- end }}

{{- define "privacyidea.mysql.realRootPassword" -}}
  {{required "mysql.rootPassword must be provided" .Values.mysql.rootPassword}}
{{- end }}

{{- define "privacyidea.mysql.encryptedPassword" -}}
  {{- include "privacyidea.mysql.realPassword" . | b64enc | quote -}}
{{- end }}

{{- define "privacyidea.mysql.encryptedRootPassword" -}}
  {{- include "privacyidea.mysql.realRootPassword" . | b64enc | quote -}}
{{- end }}

{{- define "privacyidea.encryptedAdminPassword" -}}
  {{-  required "privacyidea.adminPassword must be provided" .Values.privacyidea.adminPassword | b64enc | quote -}}
{{- end }}