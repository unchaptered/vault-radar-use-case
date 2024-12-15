set -e 

time -p (
    source ../.env

    DOCKER_API_VERSION=$DOCKER_API_VERSION \
        HCP_PROJECT_ID=$HCP_PROJECT_ID \
        HCP_CLIENT_ID=$HCP_CLIENT_ID \
        HCP_CLIENT_SECRET=$HCP_CLIENT_SECRET \
        vault-radar scan docker-image --image louislam/uptime-kuma:1 --outfile action.log 
)