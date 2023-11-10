#!/bin/bash
echo "[web_servers]" > inventory
aws ec2 describe-instances --query 'Reservations[].Instances[].{PublicIp: PublicIpAddress}' --output json | jq -r '.[] | select(.PublicIp) | .PublicIp' >> inventory