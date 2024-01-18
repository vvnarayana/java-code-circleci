#!/bin/bash

JIRA_URL="https://veerav.atlassian.net/rest/api/2/issue/CI-4"
ARTIFACT_LINK=$(grep ARTIFACT_LINK /tmp/artifacts/$BASH_ENV_FILENAME | cut -d'=' -f2)

curl -u "veera.v@trundl.com:$JIRA_API_TOKEN" -X PUT -H "Content-Type: application/json" \
     -d "{\"update\": {\"comment\": [{\"add\": {\"body\": \"Latest Artifact link: $ARTIFACT_LINK\"}}]}}" \
     $JIRA_URL
