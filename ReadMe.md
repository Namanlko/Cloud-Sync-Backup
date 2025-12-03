# **Automated Backup Script**

`backup.sh` is a simple and efficient Bash script designed to take periodic backups of any folder on a Linux system.
It recursively compresses the source directory into a ZIP file and stores it in the specified destination folder.

## 🚀 **Features**

* Takes backup of any directory.
* Recursively zips all files and sub-folders.
* Stores backup with a timestamp for easy identification.
* Can be automated using `cron`.
* Supports integration with **AWS S3** for cloud backup and improved data durability.

## 📝 **How to Use it?**

#### **Syntax:**

```bash
./backup.sh <Source> <Destination>
```

#### **Example:**

```bash
./backup.sh /home/ubuntu/scripts/ /home/ubuntu/backup/
```

This will create a ZIP file containing all files from `/home/ubuntu/scripts/` and store it in `/home/ubuntu/backup/`.

## ⏱️ **Automate Backups with Cron**

You can schedule the backup to run every **12 hours** using cron.

#### **Cron Expression:**

```bash
0 */12 * * * bash /home/ubuntu/backup.sh /home/ubuntu/scripts /home/ubuntu/backup
```

#### **Testing Tip:**

Set the cron job to run every 1 minute to test:

```bash
* * * * * bash /home/ubuntu/backup.sh /home/ubuntu/scripts /home/ubuntu/backup
```

To watch backup creation live:

```bash
watch ls /home/ubuntu/backup
```

# ☁️ **AWS S3 Bucket Integration**

You can sync your local backup folder to an AWS S3 Bucket, allowing secure, remote storage of your project backups.

## 🔧 **Steps to Integrate with AWS S3**

### **1) Create an S3 Bucket:**

* Open AWS Console → S3 → Create Bucket
  Example bucket: `linux-bucket`

### **2) Create an IAM User:**

* Create a user with **AmazonS3FullAccess** permission.

### **3) Install AWS CLI:**

Refer to the official documentation:
[https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)

### **4) Configure AWS CLI:**

Run the following commands:

- #### **Check AWS CLI installation**

```bash
aws --version
```

- #### **Configure AWS credentials:**

```bash
aws configure
```

- #### **List S3 Buckets:**

```bash
aws s3 ls
```

- #### **Sync Local Backup Folder to S3:**

```bash
aws s3 sync backup/ s3://linux-bucket
```

This uploads all backup ZIP files to your S3 bucket.