# Stage 1: Restore dependencies (uses image with .NET SDK)
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-stage

# Set working directory with appropriate permissions
WORKDIR /app

# Grant read/write/execute permissions to the build user on the working directory
RUN chmod -R 775 /app

# Copy the project ( . ) to avoid unnecessary files
COPY . .

# Set user to a dedicated build user with access (e.g., builduser)
USER builduser

# Restore dependencies using dotnet restore
RUN dotnet restore

# Stage 2: Build and copy the application (smaller image)
FROM microsoft/dotnet:6.0-aspnet AS final-stage

# Copy only the project files from the build stage
COPY --from=build-stage /app .

# Set user to non-root user for security (e.g., nobody)
USER nobody

# Expose port 80 for the application
EXPOSE 80

# Run the application using default web server (kestrel)
ENTRYPOINT ["dotnet", "WebApp-ASP.Net-core.dll"]  # Replace with your actual application name
