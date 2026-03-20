#!/bin/bash
PROJECT_ID=$1
JOB_NAME="fetch-rates-job"
REGION="us-central1"
IMAGE_NAME="gcr.io/$PROJECT_ID/currency-service"

if [ -z "$PROJECT_ID" ]; then
  echo "Usage: ./deploy_job.sh <PROJECT_ID>"
  exit 1
fi

# Load .env variables
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
fi

echo "Deploying Cloud Run Job: $JOB_NAME using image $IMAGE_NAME..."

# Deploy the job
# We reuse the same image but override the command to run the job script
gcloud run jobs deploy $JOB_NAME \
  --image $IMAGE_NAME \
  --region $REGION \
  --command "node" \
  --args "jobs/fetchRates.js" \
  --set-env-vars="NODE_ENV=production,APP_KEY=$APP_KEY,EXCHANGE_API_KEY=$EXCHANGE_API_KEY,PROJECT_ID=$PROJECT_ID" \
  --max-retries 3 \
  --task-timeout "5m"

echo "Job deployed."
echo "To execute immediately: gcloud run jobs execute $JOB_NAME --region $REGION"
echo "To schedule (e.g. daily at 00:15):"
echo "gcloud scheduler jobs create http ${JOB_NAME}-scheduler \\"
echo "  --location $REGION \\"
echo "  --schedule=\"15 0 * * *\" \\"
echo "  --uri=\"https://$REGION-run.googleapis.com/apis/run.googleapis.com/v1/namespaces/$PROJECT_ID/jobs/$JOB_NAME:run\" \\"
echo "  --http-method POST \\"
echo "  --oauth-service-account-email <YOUR-SERVICE-ACCOUNT-EMAIL>"
