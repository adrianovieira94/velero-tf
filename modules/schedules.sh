#!/bin/bash

$cluster = "notificicacoes-prd"

#Diario
velero create schedule daily-eks-$cluster  --schedule="0 */6 * * *" --ttl=168h

#Semanal
velero create schedule weekly-eks-$cluster  --schedule="0 14 * * 5" --ttl=336h

#Mensal
velero create schedule monthly-eks-$cluster  --schedule="0 9 * * 5" --ttl=2016h