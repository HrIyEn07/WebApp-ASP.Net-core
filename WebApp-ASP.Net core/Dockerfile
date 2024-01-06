FROM mcr.microsoft.com/dotnet/sdk:6.0

WORKDIR /app

# Copy the project file
COPY . .

# Clean 'obj' directory and restore dependencies
RUN rd /s /q obj && dotnet restore

# Copy the remaining application files
COPY . .

# Build the application
RUN dotnet build -c Release -o out

# Expose port 80 for the application
EXPOSE 80

# Specify the entry point to start the application
ENTRYPOINT ["dotnet", "WebApp-ASP.Net core.dll"]
