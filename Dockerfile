FROM pgvector/pgvector:0.8.0-pg17

# Set environment variables
ENV POSTGRES_HOST_AUTH_METHOD=trust
ENV PGDATA=/var/lib/postgresql/data/pgdata

# Create the pgdata directory and set ownership
RUN mkdir -p /var/lib/postgresql/data/pgdata && \
    chown -R postgres:postgres /var/lib/postgresql/data

# Copy initialization script
COPY ./add-vector-extension.sql /docker-entrypoint-initdb.d/

# Expose PostgreSQL port
EXPOSE 5432

