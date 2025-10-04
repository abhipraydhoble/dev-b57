# Crontab:
- It is used to automate repetitive tasks at specific intervals.



```
* * * * * command_to_run
- - - - -
| | | | |
| | | | +---- Day of the week (0 - 6) [Sunday = 0]
| | | +------ Month (1 - 12)
| | +-------- Day of the month (1 - 31)
| +---------- Hour (0 - 23)
+------------ Minute (0 - 59)
```
# Crontab Installation on Amazon Linux & Ubuntu


---

## **1. Installing Crontab**

### **Amazon Linux (Amazon Linux 2 & 2023)**
```bash
sudo yum install cronie -y
```
Enable and start the `crond` service:
```bash
sudo systemctl enable crond
sudo systemctl start crond
```
Verify `crond` is running:
```bash
sudo systemctl status crond
```

### **Ubuntu (22.04, 24.04, etc.)**
```bash
sudo apt update
sudo apt install cron -y
```
Enable and start the `cron` service:
```bash
sudo systemctl enable cron
sudo systemctl start cron
```
Verify `cron` is running:
```bash
sudo systemctl status cron
```

---









### Edit the cron jobs:
````
crontab -e
````

*example* 
1. Run a script every day at 8:30 AM
````
   30 8 19 jun * touch example.txt
````
   
View the current cron jobs:
````
crontab -l
````

## Common Cron Job Examples

| **Expression** | **Meaning** |
|--------------|------------|
| `0 0 * * * ./backup.sh` | Run backup daily at midnight |
| `0 6,18 * * * ./backup.sh` | Run backup at 6 AM & 6 PM |
| `0 */6 * * * ./monitor.sh` | Run monitoring every 6 hours |
| `*/10 * * * * ./script.sh` | Run script every 10 minutes |
| `0 * 20 7 * ./backup.sh` | Run backup every hour on July 20th |





Remove all cron jobs:
````
crontab -r
````
