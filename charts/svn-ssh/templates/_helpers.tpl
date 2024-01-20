
{{- define "app.name" -}}
{{- include "common.names.name" . -}}
{{- end -}}

{{- define "app.fullname" -}}
{{- include "common.names.fullname" . -}}
{{- end -}}

{{- define "app.deployment.name" -}}
    {{- if and .Values.deployment .Values.deployment.nameOverride -}}
        {{- print .Values.deployment.nameOverride -}}
    {{- else -}}
        {{- printf "%s" (include "app.fullname" .) -}}
    {{- end -}}
{{- end -}}

{{- define "app.service.name" -}}
    {{- if and .Values.service .Values.service.nameOverride -}}
        {{- print .Values.service.nameOverride -}}
    {{- else -}}
        {{- printf "%s" (include "app.fullname" .) -}}
    {{- end -}}
{{- end -}}

{{- define "app.pvc.sshd.name" -}}
    {{- if and .Values.persistence .Values.persistence.sshd .Values.persistence.sshd.nameOverride -}}
        {{- print .Values.persistence.sshd.nameOverride -}}
    {{- else -}}
        {{- printf "%s-sshd" (include "app.fullname" .) -}}
    {{- end -}}
{{- end -}}

{{- define "app.pvc.ssh.name" -}}
    {{- if and .Values.persistence .Values.persistence.ssh .Values.persistence.ssh.nameOverride -}}
        {{- print .Values.persistence.ssh.nameOverride -}}
    {{- else -}}
        {{- printf "%s-ssh" (include "app.fullname" .) -}}
    {{- end -}}
{{- end -}}

{{- define "app.pvc.data.name" -}}
    {{- if and .Values.persistence .Values.persistence.data .Values.persistence.data.nameOverride -}}
        {{- print .Values.persistence.data.nameOverride -}}
    {{- else -}}
        {{- printf "%s-data" (include "app.fullname" .) -}}
    {{- end -}}
{{- end -}}

{{- define "app.cmp.sshd.name" -}}
    {{- if and .Values.configmap .Values.configmap.sshd .Values.configmap.sshd.nameOverride -}}
        {{- print .Values.configmap.sshd.nameOverride -}}
    {{- else -}}
        {{- printf "%s-sshd-config" (include "app.fullname" .) -}}
    {{- end -}}
{{- end -}}

{{/*
Returns the proper service account name depending if an explicit service account name is set
in the values file. If the name is not set it will default to either mongodb.fullname if serviceAccount.create
is true or default otherwise.
*/}}
{{- define "app.serviceAccountName" -}}
    {{- if .Values.serviceAccount.create -}}
        {{- default (include "app.fullname" .) (print .Values.serviceAccount.name) -}}
    {{- else -}}
        {{- default "default" (print .Values.serviceAccount.name) -}}
    {{- end -}}
{{- end -}}

{{/*
Return the proper image name
*/}}
{{- define "app.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.deployment.image "global" .Values.global) -}}
{{- end -}}


