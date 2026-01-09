{{- define "banking-app.name" -}}
{{ .Chart.Name }}
{{- end }}

{{- define "banking-app.fullname" -}}
{{ .Release.Name }}-{{ .Chart.Name }}
{{- end }}

{{- define "banking-app.labels" -}}
app.kubernetes.io/name: {{ include "banking-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
