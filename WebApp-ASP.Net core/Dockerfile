# Use the ASP.NET base image
FROM mcr.microsoft.com/dotnet/aspnet:6.0-nanoserver-1809 AS base
WORKDIR /app
EXPOSE 5070
ENV ASPNETCORE_URLS=http://+:5070

# Use the SDK image for building the app
FROM mcr.microsoft.com/dotnet/sdk:6.0-nanoserver-1809 AS build
ARG configuration=Release
WORKDIR /src

# Copy the .csproj file into the build container
COPY WebApp-ASP.Net core.csproj ./
RUN dotnet restore "WebApp-ASP.Net core.csproj"

# Copy the rest of the application code
COPY . .

# Build the application
WORKDIR /src
RUN dotnet build "WebApp-ASP.Net core.csproj" -c $configuration -o /app/build

# Publish the application
FROM build AS publish
ARG configuration=Release
RUN dotnet publish "WebApp-ASP.Net core.csproj" -c $configuration -o /app/publish /p:UseAppHost=false

# Create the final image
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "WebApp-ASP.Net core.dll"]
