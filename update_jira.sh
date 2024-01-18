#!/bin/bash

JIRA_URL="https://veerav.atlassian.net/rest/api/2/issue/CI-4"
ARTIFACT_LINK="https://output.circle-artifacts.com/output/job/d7e80c45-3011-47a7-a2b0-535aba1968bf/artifacts/0/tmp/artifacts/jiracon22-1.0.0.war"

# Extract the issue key from the JIRA URL
ISSUE_KEY=$(basename $JIRA_URL)

curl -u "veera.v@trundl.com:$JIRA_API_TOKEN" -X POST -H "Content-Type: application/json" \
     -d "{\"type\":{\"name\":\"blocks\"},\"inwardIssue\":{\"key\":\"$ISSUE_KEY\"},\"outwardIssue\":{\"key\":\"$ISSUE_KEY\"}}" \
     $JIRA_URL/links

