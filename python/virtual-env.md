# Python Virtual Environment

<br>

## Option 1: Using `virtualenv` (Linux / macOS)

### Install Virtual Environment

```bash
pip install virtualenv
```

### Check Version

```bash
virtualenv --version
```

### Create Virtual Environment

```bash
virtualenv env
```

### Activate Virtual Environment

```bash
source env/bin/activate
```

### Deactivate Virtual Environment

```bash
deactivate
```


<br><br>

## Option 2: Using `venv` (Built-in for Python 3)

### Install venv

```bash
sudo apt install python3.12-venv
```

### Create Virtual Environment

```bash
python3 -m venv venv
```

### Activate Virtual Environment

```bash
source venv/bin/activate
```

### Install Packages

```bash
pip install <package_name>
```

### Deactivate Virtual Environment

```bash
deactivate
```

<br><br>

##  For Windows Users

### Install Virtual Environment

```bash
pip install virtualenv
```

### Create Virtual Environment

```bash
python -m venv myenv
```

### Activate Virtual Environment

```bash
myenv\Scripts\activate
```

### Deactivate Virtual Environment

```bash
deactivate
```
