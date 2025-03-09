# Use the official Windows-based .NET Framework 4.8 image as the base image
FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2019


# Set the working directory to the folder where IIS serves web applications
WORKDIR /inetpub/wwwroot

# Copy the published application files into the container
COPY ./bin/Release/Publish/ .

# Expose port 80 (default for web applications)
EXPOSE 80

# Set the entry point for the container to monitor the IIS service
ENTRYPOINT ["C:\\ServiceMonitor.exe", "w3svc"]
