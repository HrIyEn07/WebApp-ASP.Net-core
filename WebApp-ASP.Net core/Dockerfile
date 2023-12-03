FROM mcr.microsoft.com/dotnet/aspnet:6.0

WORKDIR /app

RUN dotnet restore

COPY . .

EXPOSE 80

ENTRYPOINT ["dotnet", "WebApp-ASP.Net core.dll"]
