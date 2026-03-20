#!/bin/bash
PROJECT_ID=$1
SERVICE_NAME="currency-service"
REGION="us-central1"

if [ -z "$PROJECT_ID" ]; then
  echo "Usage: ./deploy.sh <PROJECT_ID>"
  exit 1
fi

# Load .env variables
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
fi

echo "Deploying $SERVICE_NAME to project $PROJECT_ID in $REGION..."

# Build and push image
gcloud builds submit --tag gcr.io/$PROJECT_ID/$SERVICE_NAME .

# Deploy to Cloud Run
# Note: Requires Cloud Run API to be enabled.
# We map env vars. Ensure EXCHANGE_API_KEY is available in current env or pass it explicitly.
# For security, better to use Secret Manager, but for simplicity here we assume simple env vars.

echo "Deploying to Cloud Run..."
gcloud run deploy $SERVICE_NAME \
  --image gcr.io/$PROJECT_ID/$SERVICE_NAME \
  --platform managed \
  --region $REGION \
  --allow-unauthenticated \
  --set-env-vars="NODE_ENV=production,APP_KEY=$APP_KEY,EXCHANGE_API_KEY=$EXCHANGE_API_KEY,ALLOW_NO_AUTH=$ALLOW_NO_AUTH,PROJECT_ID=$PROJECT_ID"
  
# Note: You may need to set specific env vars like EXCHANGE_API_KEY via GCP Console or command line:
# --set-env-vars="EXCHANGE_API_KEY=your_key"
