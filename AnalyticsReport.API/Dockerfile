FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS base
WORKDIR /app
EXPOSE 8080

FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src
COPY ["AnalyticsReport.API/AnalyticsReport.API.csproj", "AnalyticsReport.API/"]
COPY ["Shared.CL/Shared.CL.csproj", "Shared.CL/"]
RUN dotnet restore "AnalyticsReport.API/AnalyticsReport.API.csproj"
COPY . .
WORKDIR "/src/AnalyticsReport.API"
RUN dotnet publish -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "AnalyticsReport.API.dll"]
