#!/bin/bash
velero create schedule daily-eks-notificicacoes-hml  --schedule="0 */6 * * *" --ttl=168h

velero create schedule weekly-eks-notificicacoes-hml  --schedule="0 14 * * 5" --ttl=336h

velero create schedule monthly-eks-notificicacoes-hml  --schedule="0 9 * * 5" --ttl=672h