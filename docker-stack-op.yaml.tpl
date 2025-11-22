---
services:
  main:
    image: {{ op://${VAULT_ID}/$ITEM_ID/deploy/image }}:main
    networks:
      - traefik-public
    deploy:
      replicas: 1
      labels:
        # Enable Traefik
        - "traefik.enable=true"
        - "traefik.docker.network=traefik-public"
        - "traefik.constraint-label=traefik-public"
        ## Service
        - "traefik.http.services.{{ op://${VAULT_ID}/$ITEM_ID/deploy/stack }}-{{ op://${VAULT_ID}/$ITEM_ID/deploy/service }}-main.loadbalancer.server.port={{ op://${VAULT_ID}/$ITEM_ID/deploy/port }}"
        ## Route HTTP
        - "traefik.http.routers.{{ op://${VAULT_ID}/$ITEM_ID/deploy/stack }}-{{ op://${VAULT_ID}/$ITEM_ID/deploy/service }}-main-http.rule=Host(`{{ op://${VAULT_ID}/$ITEM_ID/domain/main }}`)"
        - "traefik.http.routers.{{ op://${VAULT_ID}/$ITEM_ID/deploy/stack }}-{{ op://${VAULT_ID}/$ITEM_ID/deploy/service }}-main-http.entrypoints=http"
        - "traefik.http.routers.{{ op://${VAULT_ID}/$ITEM_ID/deploy/stack }}-{{ op://${VAULT_ID}/$ITEM_ID/deploy/service }}-main-http.middlewares=https-redirect"
        ## Route HTTPS
        - "traefik.http.routers.{{ op://${VAULT_ID}/$ITEM_ID/deploy/stack }}-{{ op://${VAULT_ID}/$ITEM_ID/deploy/service }}-main-https.rule=Host(`{{ op://${VAULT_ID}/$ITEM_ID/domain/main }}`)"
        - "traefik.http.routers.{{ op://${VAULT_ID}/$ITEM_ID/deploy/stack }}-{{ op://${VAULT_ID}/$ITEM_ID/deploy/service }}-main-https.entrypoints=https"
        - "traefik.http.routers.{{ op://${VAULT_ID}/$ITEM_ID/deploy/stack }}-{{ op://${VAULT_ID}/$ITEM_ID/deploy/service }}-main-https.tls.certresolver=le"
        - "traefik.http.routers.{{ op://${VAULT_ID}/$ITEM_ID/deploy/stack }}-{{ op://${VAULT_ID}/$ITEM_ID/deploy/service }}-main-https.middlewares=www-redirect"
        - "traefik.http.routers.{{ op://${VAULT_ID}/$ITEM_ID/deploy/stack }}-{{ op://${VAULT_ID}/$ITEM_ID/deploy/service }}-main-https.service={{ op://${VAULT_ID}/$ITEM_ID/deploy/stack }}-{{ op://${VAULT_ID}/$ITEM_ID/deploy/service }}-main"

networks:
  traefik-public:
    external: true
