FROM pgvector/pgvector:0.8.0-pg17

# Declare the volume for PostgreSQL data
VOLUME ["/var/lib/postgresql/data"]

# Environment variables
ARG POSTGRES_PASSWORD POSTGRES_USER POSTGRES_DB
ENV POSTGRES_PASSWORD=$POSTGRES_PASSWORD
ENV POSTGRES_USER=$POSTGRES_USER
ENV POSTGRES_DB=$POSTGRES_DB
ENV POSTGRES_HOST_AUTH_METHOD=trust

# Add the vector extension SQL script
COPY ./add-vector-extension.sql /docker-entrypoint-initdb.d/

# Expose PostgreSQL port
EXPOSE 5432
