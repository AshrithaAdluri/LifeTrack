#!/bin/bash
echo "Setting up virtual memory..."
sudo sysctl -w vm.max_map_count=262144

echo "Starting SonarQube..."
docker compose up -d sonar-db sonarqube

echo "Waiting for SonarQube to be ready..."
until docker compose logs sonarqube 2>&1 | grep -q "SonarQube is operational"; do
  echo "Still starting..."
  sleep 10
done

echo "SonarQube is ready!"
echo "Open: https://$CODESPACE_NAME-9000.app.github.dev"

echo "Running analysis..."
export PATH="$PATH:$HOME/.dotnet/tools"

dotnet sonarscanner begin \
  /k:"lifetrack" \
  /d:sonar.host.url="http://localhost:9000" \
  /d:sonar.token="sqp_0e2f9ee70861f3035dbbd1feda01ce556ac15352"

dotnet build

dotnet sonarscanner end \
  /d:sonar.token="sqp_0e2f9ee70861f3035dbbd1feda01ce556ac15352"

echo "Done! Open SonarQube and check the LifeTrack project."
