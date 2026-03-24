# 🗂️ Cloud Sync Backup Script

## 📌 Project Overview

This project demonstrates a simple and efficient **automated backup solution** for Linux systems. It provides a **Bash script** that recursively compresses any source directory into a timestamped ZIP archive and stores it in a destination folder. The solution is designed for reliability and can be easily automated with **cron** and extended to include **AWS S3** integration for durable, off-site cloud storage.

## ✨ Features

* 📂 Backup **any directory**
* 🗜️ Recursively **compress files & subdirectories**
* 🕒 Creates **timestamped backups**
* ⏱️ Easily automate with **cron jobs**
* ☁️ Optional **AWS S3 integration** for cloud storage
* 🔐 Improves **data durability and safety**

## 🏗️ Project Structure

```
Cloud-Sync-Backup
│
├── backup.sh
└── README.md
```

## ⚙️ Workflow Diagram

```
+-----------------+      +----------------------+      +-------------------------+
|   User/Script   |----->|   backup.sh          |----->|   Local Backup Folder   |
| (Manual/Cron)   |      | (Creates ZIP)        |      | (Timestamped Archive)   |
+-----------------+      +----------------------+      +------------+------------+
                                                                     |
                                                                     | Optional Sync
                                                                     v
+-----------------+      +----------------------+      +-------------------------+
|   AWS S3 Bucket |<-----|   aws s3 sync        |<-----|   AWS CLI Configured    |
| (Cloud Storage) |      | (Upload Command)     |      | (IAM User Permissions)  |
+-----------------+      +----------------------+      +-------------------------+
```

## 🛠️ Technologies Used

| Technology | Purpose |
|------------|---------|
| **Bash** | Scripting language for backup logic |
| **zip** | Compression utility |
| **cron** | Job scheduler for automation |
| **AWS CLI** | Command-line tool for S3 interaction |
| **AWS S3** | Cloud storage service |
| **AWS IAM** | Identity and access management |


## 🚀 Usage

**Syntax:**

```bash
./backup.sh <Source> <Destination>
```

**Example:**

```bash
./backup.sh /home/ubuntu/scripts/ /home/ubuntu/backup/
```

- Compress all files from `/home/ubuntu/scripts/`
- Create a **ZIP archive**
- Store it inside `/home/ubuntu/backup/`

**Example Output:**

```
backup_2026-03-12_10-30.zip
```

## ⏱️ Automate Backups with Cron

You can schedule the script to run **every 12 hours**.

**Open crontab**

```bash
crontab -e
```

**Cron Job (Every 12 Hours)**

```bash
0 */12 * * * bash /home/ubuntu/backup.sh /home/ubuntu/scripts /home/ubuntu/backup
```

**Testing the Cron Job**

- To test the script quickly, run it **every minute**:

```bash
* * * * * bash /home/ubuntu/backup.sh /home/ubuntu/scripts /home/ubuntu/backup
```

- Monitor backup creation in real time:

```bash
watch ls /home/ubuntu/backup
```

## ☁️ AWS S3 Bucket Integration

You can sync your local backups to an **Amazon S3 bucket** for secure remote storage.

#### 1️⃣ Create an S3 Bucket

1. Open **AWS Console**
2. Navigate to **S3**
3. Click **Create Bucket**

Example bucket name:

```
linux-bucket
```

#### 2️⃣ Create an IAM User

Create a new IAM user with the following permission:

```
AmazonS3FullAccess
```

This allows the script to upload backups to your S3 bucket.

#### 3️⃣ Install AWS CLI

Follow the official AWS documentation:

[https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)

#### 4️⃣ Configure AWS CLI

**Check AWS CLI installation**

```bash
aws --version
```

**Configure credentials**

```bash
aws configure
```

**You will be prompted to enter:**

```
AWS Access Key
AWS Secret Key
Region
Output format
```

#### 5️⃣ Verify S3 Access

List available S3 buckets:

```bash
aws s3 ls
```

#### 6️⃣ Sync Local Backups to S3

Upload all backups to your S3 bucket:

```bash
aws s3 sync backup/ s3://linux-bucket
```

This command will **sync all ZIP backup files** from your local backup folder to S3.

## 🔁 Optional Automation (Advanced)

You can add the **S3 sync command directly into the script** so every backup automatically uploads to the cloud.

**Example:**

```bash
aws s3 sync /home/ubuntu/backup/ s3://linux-bucket
```

### ✅ Verify Setup

```bash
# Check if cron is configured
crontab -l

# Check for new backup files
ls -l /home/ubuntu/backup

# List files in S3 bucket
aws s3 ls s3://linux-bucket
```

## 🧹 Cleanup (Optional)

If you no longer need the backups or want to free up space, you can delete local and cloud files.

```bash
# Delete local backups
rm -rf /home/ubuntu/backup/*

# Delete S3 bucket contents
aws s3 rm s3://linux-bucket --recursive

# Delete the S3 bucket
aws s3 rb s3://linux-bucket
```

## 🎓 Conclusion

This project successfully demonstrates a simple yet robust automated backup solution. By combining a Bash script with Linux automation tools and AWS cloud services, we achieved:

**Key Achievements:**

- Fully automated, scheduled backups with **cron**.
- Compressed, versioned archives for efficient storage.
- Cloud-based off-site storage with **AWS S3** for disaster recovery.
- A modular design that can be extended for different use cases (e.g., different compression tools, cloud providers).

## 🏆 Final Outcome
This project showcases expertise in shell scripting, Linux system administration, job automation, and cloud storage integration. Making it a practical addition to any system administrator's or DevOps engineer's toolkit.

*Built with ❤️ by **Naman Pandey** | Cloud Automation 🚀*
