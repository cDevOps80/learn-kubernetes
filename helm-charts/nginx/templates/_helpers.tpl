{{- define "nginx.podname" -}}
{{- if .Values.podname }}
{{- printf "%s" .Values.podname }}
{{- else }}
{{- default "pod1-default" }}
{{- end }}
{{- end }}


{{- define "nginx.labels" -}}
app: nginx
labels: labels
good: good
ram: {{ printf "%s-%s" "ram" "chaitu" }}
{{- end }}