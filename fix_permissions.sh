#!/bin/bash
PROJECT_ID=$1

if [ -z "$PROJECT_ID" ]; then
  echo "Usage: ./fix_permissions.sh <PROJECT_ID>"
  exit 1
fi

echo "Fixing permissions for project $PROJECT_ID..."

# Get Project Number
PROJECT_NUMBER=$(gcloud projects describe $PROJECT_ID --format="value(projectNumber)")
echo "Project Number: $PROJECT_NUMBER"

# Default Compute Engine Service Account (used by Cloud Run by default)
SERVICE_ACCOUNT="${PROJECT_NUMBER}-compute@developer.gserviceaccount.com"
echo "Granting roles/datastore.user to $SERVICE_ACCOUNT..."

gcloud projects add-iam-policy-binding $PROJECT_ID \
  --member="serviceAccount:${SERVICE_ACCOUNT}" \
  --role="roles/datastore.user"

echo "Done. Please wait 1-2 minutes for permissions to propagate."
