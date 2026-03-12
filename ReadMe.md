# 🗂️ Automated Backup Script

A simple and efficient **Bash script** to take **periodic backups of any folder on a Linux system**.

The script recursively compresses the source directory into a **timestamped ZIP archive** and stores it in a destination folder. It can also be automated with **cron** and synced to **AWS S3** for reliable cloud backups.


# ✨ Features

* 📂 Backup **any directory**
* 🗜️ Recursively **compress files & subdirectories**
* 🕒 Creates **timestamped backups**
* ⏱️ Easily automate with **cron jobs**
* ☁️ Optional **AWS S3 integration** for cloud storage
* 🔐 Improves **data durability and safety**


## 📦 Project Structure

```
project-folder
│
├── backup.sh
└── README.md
```

## 🚀 Usage

### Syntax

```bash
./backup.sh <Source> <Destination>
```

### Example

```bash
./backup.sh /home/ubuntu/scripts/ /home/ubuntu/backup/
```

- Compress all files from `/home/ubuntu/scripts/`
- Create a **ZIP archive**
- Store it inside `/home/ubuntu/backup/`

### Example output:

```
backup_2026-03-12_10-30.zip
```

## ⏱️ Automate Backups with Cron

You can schedule the script to run **every 12 hours**.

### Open crontab

```bash
crontab -e
```

### Cron Job (Every 12 Hours)

```bash
0 */12 * * * bash /home/ubuntu/backup.sh /home/ubuntu/scripts /home/ubuntu/backup
```

## 🧪 Testing the Cron Job

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


### 1️⃣ Create an S3 Bucket

1. Open **AWS Console**
2. Navigate to **S3**
3. Click **Create Bucket**

Example bucket name:

```
linux-bucket
```

### 2️⃣ Create an IAM User

Create a new IAM user with the following permission:

```
AmazonS3FullAccess
```

This allows the script to upload backups to your S3 bucket.


### 3️⃣ Install AWS CLI

Follow the official AWS documentation:

[https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)

### 4️⃣ Configure AWS CLI

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

### 5️⃣ Verify S3 Access

List available S3 buckets:

```bash
aws s3 ls
```

### 6️⃣ Sync Local Backups to S3

Upload all backups to your S3 bucket:

```bash
aws s3 sync backup/ s3://linux-bucket
```

This command will **sync all ZIP backup files** from your local backup folder to S3.


### 🔁 Optional Automation (Advanced)

You can add the **S3 sync command directly into the script** so every backup automatically uploads to the cloud.

**Example:**

```bash
aws s3 sync /home/ubuntu/backup/ s3://linux-bucket
```

## 📜 License

This project is open-source and available under the **MIT License**.

