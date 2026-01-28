#!/bin/bash

# -----------------------------
# Linux Server Health Monitoring Script
# -----------------------------

# Config
CONFIG_FILE="./config.conf"
LOG_FILE="./alerts.log"
TICKET_FILE="./tickets.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Thresholds (can also read from config.conf if you want)
MEMORY_THRESHOLD=5    # Example: alert if memory usage % > 5
DISK_THRESHOLD=90     # Example: alert if disk usage % > 90

# Services to monitor
SERVICES=("ssh")      # Add other critical services if needed

# -----------------------------
# Function to generate alert
# -----------------------------
generate_alert () {
  # $1 = resource/service name
  # $2 = current value or status
  echo "$DATE ALERT: $1 usage is $2%" >> $LOG_FILE
  echo "$DATE TICKET CREATED: $1 crossed SLA limit ($2%)" >> $TICKET_FILE

  # Send email notification (local mail)
  echo "$DATE ALERT: $1 usage is $2%" | mail -s "Server Alert: $1 Threshold Breach" poornalutimath@PoohsLaptop.localdomain
}

generate_service_alert () {
  # $1 = service name
  echo "$DATE ALERT: $1 service is DOWN" >> $LOG_FILE
  echo "$DATE TICKET CREATED: $1 service failure" >> $TICKET_FILE

  # Send email notification
  echo "$DATE ALERT: $1 service is DOWN" | mail -s "Server Alert: $1 Service Down" poornalutimath@PoohsLaptop.localdomain
}

# -----------------------------
# Check Memory Usage
# -----------------------------
MEMORY_USAGE=$(free | awk '/Mem:/ {printf "%.2f", $3/$2 * 100}')
if (( $(echo "$MEMORY_USAGE > $MEMORY_THRESHOLD" | bc -l) )); then
  generate_alert "Memory" "$MEMORY_USAGE"
fi

# -----------------------------
# Check Disk Usage
# -----------------------------
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
  generate_alert "Disk" "$DISK_USAGE"
fi

# -----------------------------
# Check Critical Services
# -----------------------------
for service in "${SERVICES[@]}"; do
  if ! systemctl is-active --quiet $service; then
    generate_service_alert "$service"
  fi
done

