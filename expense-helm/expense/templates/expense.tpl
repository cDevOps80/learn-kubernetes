{{- define  "expense-helm.replicas" -}}
{{- if eq .Values.env "dev" }}
replicas: 2
{{- else }}
replicas: 4
{{- end }}
{{- end }}