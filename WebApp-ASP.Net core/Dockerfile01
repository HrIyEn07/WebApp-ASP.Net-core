FROM mcr.microsoft.com/dotnet/sdk:6.0

WORKDIR /app

COPY ./ .

RUN dotnet restore

RUN dotnet publish -c Release -o out

EXPOSE 80

ENTRYPOINT ["dotnet", "./out/WebApp-ASP.Net core.dll"]

