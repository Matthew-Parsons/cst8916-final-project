# CST 8916 Final Project
Building a simulation of a monitoring system for the rideau canal using Azure

## Student Information
Name: Matthew Parsons
SID: 040909129

## Scenario Overview
Problem Statement:
The Rideau Canal Skateway, a historic and world-renowned attraction in Ottawa, needs constant monitoring to ensure skater safety. You have been hired by the National Capital Commission (NCC) to build a real-time data streaming and visualization system.

System Objectives:
1. Simulate IoT sensors at three locations (Dow's Lake, Fifth Avenue, NAC) monitoring:
    - Ice Thickness (cm)
    - Surface Temperature (°C)
    - Snow Accumulation (cm)
    - External Temperature (°C)
2. Process data in real-time using Azure Stream Analytics with 5-minute aggregation windows
3. Store processed data in Azure Cosmos DB for fast access
4. Archive historical data in Azure Blob Storage
5. Display live data through a web dashboard hosted on Azure App Service

## System Architecture
Diagram is in architecture folder.

Data Flow Explanation:
The sensor simulator sends 3 sets of information to the IoT Hub, which are each received by a different device. Those devices then send that information to the Stream Analytics, which runs and SQL query to process that information. That processed info is then sent to the Storage Account Container and the CosmosDB. the data in the CosmosDB is finally fetched by the Web Dashboard, which displays that info to the user.

Azure Services Used:
- IoT Hub
- App Service
- CosmosDB
- Stream Analytics
- Storage Account 

## Implementation Overview
### IoT Sensor Simulation (https://github.com/Matthew-Parsons/rideau-canal-sensor-simulation)
Simulates the three sensors on the rideau canal, and sends that information to the IoT hub

### Azure IoT Hub configuration


### Stream Analytics job (in query.sql in the stream analytics folder)


### Cosmos DB setup


### Blob Storage configuration


### Web Dashboard (https://github.com/Matthew-Parsons/rideau-canal-dashboard)


### Azure App Service deployment


## Repo Links
web dashboard repo: https://github.com/Matthew-Parsons/rideau-canal-dashboard
sensor simulation repo: https://github.com/Matthew-Parsons/rideau-canal-sensor-simulation
live dashboard link (will not work as resources have been deleted): https://rideaucanalstats-ccg9csbmcce4f6f9.canadacentral-01.azurewebsites.net/


## Video Demo
Video link: https://youtu.be/KGz1xMLi43I

## Setup Instructions
Prerequisites

High-level setup steps

Links to detailed setups

# Results and Analysis
Sample outputs and screenshots

Data analysis

System performance observations


## Challenges and Solutions
Challenges faced:


How challenges were solved:


## AI usage disclosure
AI Tools Used: ChatGPT

AI was used in this project for:
- Help with debugging
- Rewriting hte Sensor demo video to function with three devices instead of one, rather than having three different scripts
- Help with converting System.Timestamp into a usable string
- That's it :)

## References
Libraries used (python):
- azure.iot.device
- dotenv