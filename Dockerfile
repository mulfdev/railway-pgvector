
FROM pgvector/pgvector:0.8.0-pg17

# Define build-time arguments with default values
ARG POSTGRES_USER=postgres
ARG POSTGRES_PASSWORD=postgres
ARG POSTGRES_DB=postgres

# Set environment variables using the ARG values
ENV POSTGRES_USER=${POSTGRES_USER}
ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
ENV POSTGRES_DB=${POSTGRES_DB}
ENV POSTGRES_HOST_AUTH_METHOD=trust
ENV PGDATA=/var/lib/postgresql/data/pgdata

# Create the PGDATA directory and set appropriate permissions
RUN mkdir -p ${PGDATA} && chown -R postgres:postgres /var/lib/postgresql/data

# Copy initialization script
COPY ./add-vector-extension.sql /docker-entrypoint-initdb.d/

# Expose PostgreSQL port
EXPOSE 5432

