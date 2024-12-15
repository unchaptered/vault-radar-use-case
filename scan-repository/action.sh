set -e 

time -p (
    source ../.env

    DOCKER_API_VERSION=$DOCKER_API_VERSION \
        VAULT_RADAR_GIT_TOKEN=$VAULT_RADAR_GIT_TOKEN \
        HCP_PROJECT_ID=$HCP_PROJECT_ID \
        HCP_CLIENT_ID=$HCP_CLIENT_ID \
        HCP_CLIENT_SECRET=$HCP_CLIENT_SECRET \
        vault-radar scan repo --url https://github.com/unchaptered/vault-radar-use-case --outfile action.log 
)