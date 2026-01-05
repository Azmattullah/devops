# Debug a basic shell script in Linux

<br>

## Make script Executable and RUN

```
chmod +x script.sh

./script.sh
bash script.sh
```

## Run script in debug mode:
```
-x script.sh
```

## Set internal debug flag:
```
#!/bin/

set -x # Turn on debugging

echo "This will show step-by-step"

set +x # Turn off debugging
```

## Syntax checking without running:
```
-n script.sh
```