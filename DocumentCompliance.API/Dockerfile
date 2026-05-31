FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS base
WORKDIR /app
EXPOSE 8080

FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src
COPY ["DocumentCompliance.API/DocumentCompliance.API.csproj", "DocumentCompliance.API/"]
COPY ["Shared.CL/Shared.CL.csproj", "Shared.CL/"]
RUN dotnet restore "DocumentCompliance.API/DocumentCompliance.API.csproj"
COPY . .
WORKDIR "/src/DocumentCompliance.API"
RUN dotnet publish -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "DocumentCompliance.API.dll"]
