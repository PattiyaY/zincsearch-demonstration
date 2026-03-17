# Docker command (Run ZincSearch)
docker run -v "$(pwd)/data:/data" \
-e ZINC_DATA_PATH="/data" \
-p 4080:4080 \
-e ZINC_FIRST_ADMIN_USER=admin \
-e ZINC_FIRST_ADMIN_PASSWORD="Complexpass#123" \
-e ZINC_PROMETHEUS_ENABLE=true \
--name zincsearch \
public.ecr.aws/zinclabs/zincsearch:latest