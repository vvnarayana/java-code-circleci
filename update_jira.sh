#!/bin/bash

JIRA_URL="https://veerav.atlassian.net/rest/api/2/issue/CI-4"
ARTIFACT_LOCATION="/tmp/artifacts/jiracon22-1.0.0.war"

# Check if the artifact file exists
if [ -f "$ARTIFACT_LOCATION" ]; then
    # Construct the comment body with the correct dynamic link
    COMMENT_BODY="Latest Artifact link: [jiracon22-1.0.0.war](${CIRCLE_ARTIFACTS_URL}/output/job/${CIRCLE_WORKFLOW_ID}/artifacts/0${ARTIFACT_LOCATION})"
    
    # Make the Jira API call to update the comment
    curl -u "veera.v@trundl.com:$JIRA_API_TOKEN" -X PUT -H "Content-Type: application/json" \
         -d "{\"update\": {\"comment\": [{\"add\": {\"body\": \"$COMMENT_BODY\"}}]}}" \
         "$JIRA_URL"
else
    echo "Artifact file not found at: $ARTIFACT_LOCATION"
fi
