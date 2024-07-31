# Use the official .NET image as a parent image
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

# Use the SDK image for build and publish
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
# COPY ["YourProject.csproj", "./"]
# RUN dotnet restore "./YourProject.csproj"
# COPY . .
# WORKDIR "/src/."
# RUN dotnet build "YourProject.csproj" -c Release -o /app/build

FROM build AS publish
# RUN dotnet publish "YourProject.csproj" -c Release -o /app/publish

# Final stage/image
FROM base AS final
WORKDIR /app
# COPY --from=publish /app/publish .
# ENTRYPOINT ["dotnet", "YourProject.dll"]
