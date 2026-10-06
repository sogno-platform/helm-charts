{{/*
Expand the name of the chart.
*/}}
{{- define "platform-demo.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Create a default fully qualified app name.
We truncate at 63 chars because Kubernetes resource names are DNS compatible.
If release name contains chart name it will be used as the full name.
*/}}
{{- define "platform-demo.fullname" -}}
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
{{- define "platform-demo.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Common labels.
*/}}
{{- define "platform-demo.labels" -}}
helm.sh/chart: {{ include "platform-demo.chart" . }}
{{ include "platform-demo.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{/*
Selector labels.
*/}}
{{- define "platform-demo.selectorLabels" -}}
app.kubernetes.io/name: {{ include "platform-demo.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


{{/*
Kafka resource fullname.
*/}}
{{- define "platform-demo.kafka.fullname" -}}
{{- if .Values.kafka.fullnameOverride }}
{{- .Values.kafka.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- default "kafka" | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}


{{/*
PyVolt resource fullname.
*/}}
{{- define "platform-demo.pyvolt.fullname" -}}
{{ include "platform-demo.fullname" . }}-pyvolt
{{- end }}