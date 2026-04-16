# Zip and Unzip Files in Linux

<br>

### Install Zip and Unzip Utilities

```bash
sudo apt update
sudo apt install zip unzip -y
```

Check if installed:

```bash
which zip unzip
```

<br>

## Create (Zip) Archives

### Zip a single file

```bash
zip myarchive.zip filename.txt
```

### Zip multiple files

```bash
zip myarchive.zip file1.txt file2.txt file3.jpg
```

### Zip an entire directory (including subfolders)

```bash
zip -r myarchive.zip myfolder/
```

<br>

## Extract (Unzip) Archives

### Unzip into the current directory

```bash
unzip myarchive.zip
```

### Unzip into a specific directory

```bash
unzip myarchive.zip -d /path/to/extract/
```

<br>


### Useful Tips

* `-r` → Recursively include subdirectories when zipping
* `-d` → Specify destination directory when unzipping
* To **list files** in a zip archive without extracting:

  ```bash
  unzip -l myarchive.zip
  ```
---

<br>
<br>
<br>

# Zip and Unzip Files in Linux

### Unrar the rar file.

```
sudo unrar x 'file_name.rar'
```