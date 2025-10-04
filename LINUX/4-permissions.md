# $${\color{blue}\textbf {Linux File Permissions}}$$

- Permissions determine who can access files  
- And specify who can read, write, modify files/directories on a system

  Note : Use following commands to check File/Dir permissions
  
  ````
  ls -l
  ```` 
  ````
  ll
  ````
- to check particular Dir  permission 
  ````
  ll -d dirname
  ````
- to check particular file permission  
  ````
  ll filename
  ````    
  ````
  ls -ltr
  ````

<img width="1316" height="397" alt="image" src="https://github.com/user-attachments/assets/d2c64465-95ac-48cd-a37b-289d20b2bd0c" />



| **No.** | **Attribute**                   | **Description**                                                                 |
|---------|---------------------------------|---------------------------------------------------------------------------------|
| 1       | **File Type**                   | Indicates the type of file (normal file, directory, link, block, character, pipe). |
| 2       | **Owner Permissions**          | Permissions granted to the owner of the file/directory (read, write, execute).  |
| 3       | **Group Permissions**          | Permissions granted to the group associated with the file/directory.            |
| 4       | **Other User Permissions**     | Permissions granted to other users (not owner or group).                        |
| 5       | **Link Count**                  | The number of links or references to the file.                                  |
| 6       | **Owner of File/Directory**    | The username of the owner.                                                     |
| 7       | **Group Owner of File/Directory** | The group associated with the file/directory.                                   |
| 8       | **File Size**                   | Size of the file in bytes.                                                     |
| 9       | **Creation Date and Time**      | The date and time when the file or directory was created or last modified.      |
| 10      | **File/Directory Name**         | The name of the file or directory.                                             |



## **File Types in Linux**


| **Symbol** | **File Type**          | **Description**                                     |
|------------|------------------------|-----------------------------------------------------|
| `-`        | Normal file            | Text files, binary files, etc.                     |
| `d`        | Directory              | Represents a folder containing other files/folders. |
| `l`        | Link file              | Symbolic link pointing to another file or folder.  |
| `b`        | Block device file      | Used for block storage devices like hard disks.    |
| `c`        | Character device file  | Handles data character by character, e.g., keyboard.|
| `P`        | Pipe                   | Used for inter-process communication.   

---

## $${\color{blue}\textbf {Ownership in Linux}}$$

In Linux, file ownership is divided into three categories:
1. **Owner:** The user who created the file.
2. **Group:** The primary group of the file owner.
3. **Other:** All other users on the system.

---

### **Permission Breakdown**
| **Permission** | **Symbol** | **Value** | **Description**         |
|-----------------|------------|-----------|-------------------------|
| Read            | r          | 4         | Open, view, or list the file/directory. |
| Write           | w          | 2         | Edit or modify the file. |
| Execute         | x          | 1         | Run the file as a program. |

---

### **Example: Change Ownership**

#### **Scenario**
The directory `demo` is owned by user `root`. To change ownership to user `abhi`, use the following commands:

1. **Change Owner**
   ```bash
   syntax: chown username filename
   
   chown abhi demofile.txt
   ```
2. **Change Group Owner**
   ```
   syntax: chgrp groupname filename
   
   chgrp dev demofile.txt
   ````
3. **Change Owner and Group Simultaneously** 
   ```
   chown user:Grp demofile.txt
   ```



# $${\color{blue}\textbf{Umask}}$$

### $${\color{green}\textbf{Default Permissions}}$$
The `umask` command is used to set default permissions for files and directories.

#### $${\color{orange}\textbf{Root User: umask 022}}$$
1. **File Permissions:** `644` → `rw- r-- r--`
2. **Directory Permissions:** `755` → `rwx r-x r-x`

#### $${\color{purple}\textbf{Example (Directory):}}$$
Maximum permission - Default permission = `umask`

- $${\color{cyan}777 - 755 = 022}$$  
- $${\color{cyan}777 - 032 = 745}$$

#### $${\color{purple}\textbf{Example (File):}}$$
Maximum permission - Default permission = `umask`

- $${\color{cyan}666 - 644 = 022}$$

#### $${\color{orange}\textbf{Local User: umask 002}}$$
1. **File Permissions:** `664` → `rw- rw- r--` → $${\color{cyan}666 - 664 = 002}$$
2. **Directory Permissions:** `775` → `rwx rwx r-x` → $${\color{cyan}777 - 775 = 002}$$

---
#### $${\color{orange}\textbf{Root User:}}$$
1. **File Permissions:** `644` → `rw- r-- r--`
2. **Directory Permissions:** `755` → `rwx r-x r-x`


#### $${\color{orange}\textbf{Local User: }}$$
1. **File Permissions:** `664` → `rw- rw- r--` 
2. **Directory Permissions:** `775` → `rwx rwx r-x` 

---
## **Root User**

### File Permissions: $${\color{orange}\textbf{644}}$$ ($${\color{green}\textbf{rw- r-- r--}}$$)
#### Symbolic Mode:
```bash
chmod u=rw,g=r,o=r demo.txt
```
#### Numeric Mode:
```bash
chmod 644 demo.txt
```

### Directory Permissions: $${\color{orange}\textbf{755}}$$ ($${\color{green}\textbf{rwx r-x r-x}}$$)
#### Symbolic Mode:
```bash
chmod u=rwx,g=rx,o=rx <directory>
```
#### Numeric Mode:
```bash
chmod 755 <directory>
```

---

## **Local User**

### File Permissions: $${\color{orange}\textbf{664}}$$ ($${\color{green}\textbf{rw- rw- r--}}$$)
#### Symbolic Mode:
```bash
chmod u=rw,g=rw,o=r demo.txt
```
#### Numeric Mode:
```bash
chmod 664 demo.txt
```

### Directory Permissions: $${\color{orange}\textbf{775}}$$ ($${\color{green}\textbf{rwx rwx r-x}}$$)
#### Symbolic Mode:
```bash
chmod u=rwx,g=rwx,o=rx <directory>
```
#### Numeric Mode:
```bash
chmod 775 <directory>
```

---


## $${\color{blue}\textbf{ACL: Access Control List}}$$

Access Control List (ACL) is used to grant specific permissions to users for particular files or directories.

### $${\color{green}\textbf{Commands:}}$$
- **Set Permissions:**  
```bash
  setfacl -m u:username:rwx filename
```
**View Permissions**
```
getfacl filename
```
**Remove Permissions:**

```
setfacl -x u:username filename
```

## Comparison of Hard Link (HL) and Soft Link (SL)

![image](https://github.com/user-attachments/assets/474fcd82-edbb-4ed5-b28d-543a5ff319e2)

| **Aspect**       | **Hard Link (HL)**                                 | **Soft Link (SL)**                             |
|-------------------|---------------------------------------------------|-----------------------------------------------|
| **Purpose**       | Acts as a backup.                                 | Acts as a shortcut.                           |
| **File Size**     | Same as the original file.                        | Different from the original file.             |
| **Inode Number**  | Same as the original file.                        | Different from the original file.             |
| **File Deletion** | The hard link remains unaffected if the original file is deleted. | The soft link becomes invalid if the original file is deleted. |
| **Directories**   | Hard links to directories are not possible.       | Soft links to directories are possible.       |
| **Link Count**    | Affects the link count (increases or decreases by 1. | Does not affect the link count.              |



### Hard Link Command
````
ln filename hardlink
````
### Soft Link File
````
ln -s filename softlink
````
