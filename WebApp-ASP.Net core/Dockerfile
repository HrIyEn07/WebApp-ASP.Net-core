# Use lightweight mcr.microsoft.com/dotnet/aspnet:6.0 image as base
FROM mcr.microsoft.com/dotnet/aspnet:6.0

# Copy the application source code from current directory
WORKDIR /app

# Copy everything from the current directory ( . ) to the working directory
COPY . .

# Restore dependencies using dotnet restore
RUN dotnet restore

# Build the application using dotnet publish
RUN dotnet publish -c Release -o out

# Set the working directory to the output folder where the published application resides
WORKDIR /app/out

# Expose port 80 for the application to listen on
EXPOSE 80

# Run the application using the default web server
ENTRYPOINT ["dotnet", "WebApp-ASP.Net-core.dll"]  # Replace with your application name
