# Currency Service Handbook

Internal guide for developing, deploying, and managing the Currency Service on Google Cloud.

## Database & Architecture
- **Database**: Google Cloud Firestore (Native Mode).
- **Service**: Cloud Run (Node.js/Fastify) for HTTP API.
- **Background Jobs**: Cloud Run Jobs for scheduled tasks (e.g., fetching rates).
- **Schema**:
  - `currencies`: Collection of currency definitions including translations.
  - `exchange_rates`: Collection of daily exchange rates.

## Prerequisities
Ensure you have the Google Cloud SDK installed and authenticated.

```bash
# Login to Google Cloud
gcloud auth login

# Set your project ID
gcloud config set project auto-currency-service  # Replace with actual project ID if different
```

## Local Development

1. **Install Dependencies**
   ```bash
   npm install
   ```

2. **Environment Setup**
   Create a `.env` file (see `.env.example` if available) with:
   ```env
   PORT=3000
   PROJECT_ID=your-project-id
   EXCHANGE_API_KEY=your-api-key
   APP_KEY=your-secret-key
   ```
   **Note**: All API requests must include the `x-app-key` header with the value of `APP_KEY`.

3. **Authentication**
   For local development (accessing Firestore), use Application Default Credentials or a Service Account Key.
   ```bash
   gcloud auth application-default login
   ```
   *If that fails due to policy, use a service account key:*
   ```bash
   export GOOGLE_APPLICATION_CREDENTIALS="./service-account.json"
   ```

4. **Run Locally**
   ```bash
   npm start
   ```
   Example request:
   ```bash
   curl -H "x-app-key: <APP_KEY>" http://localhost:3000/currencies
   ```

## Deployment

### 1. Web Service (API)
Deploys the Fastify API to Cloud Run. The script automatically syncs `.env` variables to Cloud Run.

```bash
./deploy.sh <PROJECT_ID>

# Example
./deploy.sh project-5b899a43-ec93-4625-ae9
```

### 2. Background Jobs
Deploys the `fetchRates.js` script as a Cloud Run Job.

```bash
./deploy_job.sh <PROJECT_ID>
```

## Operations & Monitoring

### Check Service Status
View details about the running Web Service.
```bash
gcloud run services describe currency-service --region us-central1
```

### Check Job Status
View details about the Background Job.
```bash
gcloud run jobs describe fetch-rates-job --region us-central1
```

### Manual Job Execution
Trigger the rates update manually (e.g., if it failed or you need immediate data).
```bash
gcloud run jobs execute fetch-rates-job --region us-central1
```

### Logs
View logs for the service or job.
```bash
# Stream logs for the service
gcloud logging read "resource.type=cloud_run_revision AND resource.labels.service_name=currency-service" --limit 20 --format "value(textPayload)"

# Stream logs for the job
gcloud logging read "resource.type=cloud_run_job AND resource.labels.job_name=fetch-rates-job" --limit 20 --format "value(textPayload)"
```

## Troubleshooting

### "Permission Denied" on Startup
If the service fails to start with "Missing permissions" to Firestore:
1. Ensure the Cloud Run Service Account has the `Cloud Datastore User` role.
2. Run the fix script:
   ```bash
   ./fix_permissions.sh <PROJECT_ID>
   ```

### "Address already in use" (Local)
If `npm start` fails locally:
```bash
lsof -i :3000
kill -9 <PID>
```

### Migration
If you need to re-import data from SQL dump:
```bash
node scripts/migrate_sql_to_firestore.js
```