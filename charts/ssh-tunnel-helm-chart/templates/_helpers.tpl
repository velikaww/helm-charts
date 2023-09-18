{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "sshtunnel.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "sshtunnel.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "sshtunnel.claimname.sshd-dir" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s-sshd-dir" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "sshtunnel.claimname.ssh-dir" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s-ssh-dir" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "sshtunnel.configmapname.ssh-config" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s-ssh-config" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
