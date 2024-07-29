FROM mcr.microsoft.com/dotnet/aspnet:6.0-nanoserver-1809 AS base
WORKDIR /app
EXPOSE 5070

ENV ASPNETCORE_URLS=http://+:5070

FROM mcr.microsoft.com/dotnet/sdk:6.0-nanoserver-1809 AS build
ARG configuration=Release
WORKDIR /src
COPY ["WebApp-ASP.Net-core/WebApp-ASP.Net core/WebApp-ASP.Net core.csproj", "WebApp-ASP.Net-core/WebApp-ASP.Net core/"]
RUN dotnet restore "WebApp-ASP.Net-core/WebApp-ASP.Net core/WebApp-ASP.Net core.csproj"
COPY . .
WORKDIR "/src/WebApp-ASP.Net-core/WebApp-ASP.Net core"
RUN dotnet build "WebApp-ASP.Net core.csproj" -c $configuration -o /app/build

FROM build AS publish
ARG configuration=Release
RUN dotnet publish "WebApp-ASP.Net core.csproj" -c $configuration -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "WebApp-ASP.Net core.dll"]
