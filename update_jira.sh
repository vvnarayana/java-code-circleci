#!/bin/bash

JIRA_URL="https://veerav.atlassian.net/rest/api/2/issue/CI-4"
ARTIFACT_LINK="https://output.circle-artifacts.com/output/job/d7e80c45-3011-47a7-a2b0-535aba1968bf/artifacts/0/tmp/artifacts/jiracon22-1.0.0.war"

curl -u "veera.v@trundl.com:$JIRA_API_TOKEN" -X PUT -H "Content-Type: application/json" \
     -d "{\"update\": {\"comment\": [{\"add\": {\"body\": \"Artifact link: $ARTIFACT_LINK\"}}]}}" \
     $JIRA_URL

