# terraform_exec

### Build
```bash
docker run --rm -i hadolint/hadolint /bin/hadolint --ignore DL3008 - < Dockerfile
docker build -t terraform_exec .
```

### Scan
```bash
docker scan terraform_exec
```

### Deploy
```bash
docker tag terraform_exec quantifex/terraform_exec:latest
docker push quantifex/terraform_exec:latest
```

### Manual use
``` bash
docker run --rm -it terraform_exec bash
```

### Execute terraform plan/apply
```bash
docker run -v $(pwd):/home terraform_exec plan -var-file=test.tfvars -out=test.tfplan
docker run -v $(pwd):/home terraform_exec apply test.tfplan
```