# Use the official .NET SDK image for building
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /app

# Copy the project file and restore dependencies
COPY WebApp-ASP.Net core.csproj .
RUN dotnet restore

# Copy the remaining source code
COPY . .

# Build the application
RUN dotnet publish -c Release -o out

# Use a lighter runtime image for the final image
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS runtime
WORKDIR /app

# Copy the built application from the build image
COPY --from=build /app/out .

# Expose the port the app will run on
EXPOSE 80

# Command to run the application
ENTRYPOINT ["dotnet", "WebApp-ASP.Net-core.dll"]
