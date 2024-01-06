FROM mcr.microsoft.com/dotnet/sdk:6.0

WORKDIR /app

# Copy only the necessary files for restoring dependencies
COPY ./WebApp-ASP.Net core.csproj ./
COPY ./NuGet.config ./

# Restore dependencies separately to leverage Docker cache
RUN dotnet restore

# Copy the entire application
COPY . .

# Build and publish the application
RUN dotnet publish -c Release -o out

# Expose port 80 for the application
EXPOSE 80

# Specify the entry point to start the application
ENTRYPOINT ["dotnet", "./out/WebApp-ASP.Net core.dll"]
