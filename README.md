# Linux Server Monitoring System 

## 📌 Project Overview

This project is a **simple Linux server health monitoring system** built using **Bash scripting**. It continuously checks key system resources and services, logs alerts, creates tickets, and sends email notifications when thresholds are crossed.

This project is designed to **simulate real-world NOC (Network Operations Center) monitoring**, making it ideal for **beginners, students, and system engineer/NOC roles**.

---

## 🎯 What This Project Monitors

1. **Memory Usage (RAM)**
2. **Disk Usage**
3. **Critical Service Status (SSH)**

---

## ⚙️ How It Works (Simple Flow)

1. The script checks system resource usage.
2. It compares values with predefined threshold limits.
3. If a threshold is crossed:

   * An **alert** is logged
   * A **ticket** is created
   * An **email notification** is sent
4. The script runs **automatically every 5 minutes** using `cron`.

---

## 🗂 Project Structure

```
server_monitor/
│── monitor.sh     # Main monitoring script
│── config.conf    # Threshold configuration file
│── alerts.log     # Stores alert messages
│── tickets.log    # Stores ticket records
```

---

## 🧠 Threshold Values Used

These values are configurable in `config.conf`:

```bash
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80
```

Meaning:

* Alert if **CPU usage > 80%**
* Alert if **Memory usage > 80%**
* Alert if **Disk usage > 80%**
* Alert if **SSH service is stopped**

---

## 🧾 Sample Alert Output

```
2026-01-28 16:29:17 ALERT: Memory usage is 6.53%
2026-01-28 16:29:17 ALERT: ssh service is DOWN
```

---

## 🎫 What is a Ticket?

A **ticket** represents an issue that requires attention. In real companies, tickets are created in tools like **ServiceNow, Jira, Remedy**.

In this project, tickets are stored in:

```
tickets.log
```

Example:

```
2026-01-28 16:29:17 TICKET CREATED: ssh service failure
```

---

## 📧 Why Email Alerts?

Email alerts simulate **real-time incident notification** used in production environments.

* Implemented using **Postfix + mailutils**
* Emails are delivered locally (mailbox)

Check mail using:

```bash
mail
```

---

## ⏰ Cron Job (Automation)

The script runs automatically every **5 minutes** using cron:

```bash
*/5 * * * * /home/poornalutimath/server_monitor/monitor.sh
```

This ensures **24/7 monitoring**, just like real NOC systems.

---

## 💻 Environment Used

* **Ubuntu Linux (WSL2)** running on Windows
* Bash scripting
* Linux utilities: `free`, `df`, `systemctl`, `cron`, `mail`

---

## ✅ Why This Project is Important

* Beginner-friendly
* Real-world NOC use case
* Demonstrates Linux, automation, monitoring, and alerting
* Resume-ready project for **System Engineer / NOC roles**

---

## 📄 Resume Description (Ready-to-Use)

> Developed a Linux-based server monitoring system using Bash scripting to track memory, disk usage, and service health. Implemented automated alerting, ticket logging, email notifications, and cron-based scheduling to simulate real-world NOC monitoring operations.

---

## 🚀 Future Improvements (Optional)

* Add CPU usage monitoring
* Integrate real ticketing tools
* Push alerts to Slack or Telegram
* Dashboard visualization

---


⭐ *This project demonstrates practical Linux monitoring skills used in real IT operations.*
