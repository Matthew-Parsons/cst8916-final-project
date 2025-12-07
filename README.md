# CST 8916 Final Project
Building a simulation of a monitoring system for the rideau canal using Azure

## Student Information
Name: Matthew Parsons
SID: 040909129

## Scenario Overview
### Problem Statement:
The Rideau Canal Skateway, a historic and world-renowned attraction in Ottawa, needs constant monitoring to ensure skater safety. You have been hired by the National Capital Commission (NCC) to build a real-time data streaming and visualization system.

### System Objectives:
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

### Data Flow Explanation:
The sensor simulator sends 3 sets of information to the IoT Hub, which are each received by a different device. Those devices then send that information to the Stream Analytics, which runs and SQL query to process that information. That processed info is then sent to the Storage Account Container and the CosmosDB. the data in the CosmosDB is finally fetched by the Web Dashboard, which displays that info to the user.

### Azure Services Used:
- IoT Hub
- App Service
- CosmosDB
- Stream Analytics
- Storage Account 

## Implementation Overview
### IoT Sensor Simulation (https://github.com/Matthew-Parsons/rideau-canal-sensor-simulation)
Simulates the three sensors on the rideau canal, and sends that information to the IoT hub

### Azure IoT Hub configuration
Receives data from the 3 "sensors" with a separate device for each sensor and sends that data to the stream analytics

### Stream Analytics job (in query.sql in the stream analytics folder)
Receives the data from the IoT hub and performs SQL queries on it to process the data and send it to the cosmosdb for storage and blob storage for archival.

### Cosmos DB setup
Stores data from the stream analytics query output to be fetched and displayed by the dashboard

### Blob Storage configuration
Storage account prioritizing blob storage, with a container to store and archive data from stream analytics

### Web Dashboard (https://github.com/Matthew-Parsons/rideau-canal-dashboard)
Displays data stored in the cosmosdb in an understandable format for a regular person. Automatically updates and shows historical data

### Azure App Service deployment
Hosts the dashboard on the cloud

## Repo Links
web dashboard repo: https://github.com/Matthew-Parsons/rideau-canal-dashboard
sensor simulation repo: https://github.com/Matthew-Parsons/rideau-canal-sensor-simulation
live dashboard link (will not work as resources have been deleted): https://rideaucanalstats-ccg9csbmcce4f6f9.canadacentral-01.azurewebsites.net/


## Video Demo
Video link: https://youtu.be/KGz1xMLi43I

## Setup Instructions
### Prerequisites
- Have an azure account
- Python, Node, and VSCode or some equivalent installed
- All azure services set up and configured

### High-level setup steps
1. open the rideau-canal-sensor-simulation repo in vscode and create a virtual python environment, then open a terminal in said environment
2. run sensor-simulator.py
3. in azure, ensure that the stream analytics job is running
4. in a new vscode window, open the rideau-canal-dashboard repo and run node server.js in the terminal to start the dashboard

# Results and Analysis
Sample outputs and screenshots are in the screenshots folder. Everything worked as intended with little to no latency. Due to the random nature of the simulated sensors there was no real pattern, but the ranges of values did tend to make the conditions safe far more often than not.

## Challenges and Solutions
### Challenges faced: 
Debugging and Config Issues

### How challenges were solved: 
Rubber duck programming and ChatGPT are very helpful tools when you've been staring at code that hasn't worked for the past hour.


## AI usage disclosure
AI Tools Used: ChatGPT

AI was used in this project for:
- Help with debugging
- Rewriting the Sensor demo to function with three devices instead of one, rather than having three different scripts
- Help with converting System.Timestamp into a usable string
- That's it :)

## References
Libraries used (python):
- azure.iot.device
- dotenv