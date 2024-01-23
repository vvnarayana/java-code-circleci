#!/bin/bash

JIRA_URL="https://veerav.atlassian.net/rest/api/2/issue/CI-4"
ARTIFACT_LOCATION="/tmp/artifacts/"
JIRA_API_TOKEN="YOUR_JIRA_API_TOKEN"  # Replace with your actual Jira API token

# Check if the artifact file exists
if [ -f "$ARTIFACT_LOCATION" ]; then
    # Construct the comment body
    COMMENT_BODY="Latest Artifact link: [jiracon22-1.0.0.war](${ARTIFACT_LOCATION})"
    
    # Make the Jira API call to update the comment
    curl -u "veera.v@trundl.com:$JIRA_API_TOKEN" -X PUT -H "Content-Type: application/json" \
         -d "{\"update\": {\"comment\": [{\"add\": {\"body\": \"$COMMENT_BODY\"}}]}}" \
         "$JIRA_URL"
else
    echo "Artifact file not found at: $ARTIFACT_LOCATION"
fi

