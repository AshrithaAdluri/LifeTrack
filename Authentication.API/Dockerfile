FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS base
WORKDIR /app
EXPOSE 8080

FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src
COPY ["Authentication.API/Authentication.API.csproj", "Authentication.API/"]
COPY ["Shared.CL/Shared.CL.csproj", "Shared.CL/"]
RUN dotnet restore "Authentication.API/Authentication.API.csproj"
COPY . .
WORKDIR "/src/Authentication.API"
RUN dotnet publish -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "Authentication.API.dll"]
