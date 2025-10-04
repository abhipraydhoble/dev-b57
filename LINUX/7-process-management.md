
# Process Management

Process management refers to the handling of tasks that your machine is currently working on.

## Types of Processes
- **Jobs**: Processes mostly started by the user.
- **Daemons**: Processes that start with the system, run in the background, and typically have root privileges.

---

## Working with Jobs

### Listing Jobs
- **Command**: `jobs`
- **Options**:
  - `-r`: List running jobs.
  - `-s`: List stopped jobs.
  - `-p`: List process IDs.
  - `-l`: Display detailed information.

**Example**:
```bash
sleep 30   # Pauses the terminal for 30 seconds.
```
- **Stop Process**: `Ctrl+Z`
- **Cancel Process**: `Ctrl+C`

### Terminating Jobs
- **Command**: `kill -9 pid`


### Background and Foreground Jobs
- **Background**:
  - **Command**: `bg`
  - **Usage**: Displays stopped or background jobs.
  
  **Example**:
  ```bash
  sleep 30 &   # Runs the command in the background.
  ```

- **Foreground**:
  - **Command**: `fg`
  - **Usage**: Brings the most recent background job to the foreground.

  **Example**:
  ```bash
  fg %n   # Brings the job with ID `n` to the screen.
  ```

---

## Monitoring Processes

### Current Running Processes
- **Command**: `ps`
  - Displays currently running processes.
  - **Options**:
    - `-ef`: Displays detailed process information.

### Active Processes
- **Command**: `top`
  - Displays and manages active processes in real-time.

### System Load Information
- **Command**:
  - `uptime`: Displays the load average.
  - `w`: Displays load average and user information.

---

## Niceness Value
- **Description**: Determines the priority of a process.
- **Range**: `-20` (highest priority) to `+19` (lowest priority).
- **Default**: Usually `0`.

### Commands
1. **Set Niceness**:
   ```bash
   nice -n 10 sleep 30
   ```

2. **View Niceness**:
   ```bash
   ps -l
   ```

3. **Change Niceness**:
   ```bash
   renice -n 5 -p 4409
   # Changes the priority of process with PID 4409.
   ```

---

## Process States
- **Running**: Actively using CPU resources.
- **Stopped**: Paused process.
- **Zombie**: A process that has completed execution but still has an entry in the process table (waiting for the parent process to clean up).

---

## Killing Processes
- **Command**:
  ```bash
  kill -9 4407
  ```
  - `-9`: Signal number to forcibly terminate the process with PID 4407.
