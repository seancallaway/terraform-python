# terraform-python
Container images for running Terraform with Python

This project provides Docker images for CI/CD containing Python3 and Hashicorp Terraform. (They also include git,
because a lot of CI platforms need that.)

## Usage

Images are tagged in the following format: `${TERRAFORM_VERSION}-py${PYTHON_VERSION}`. So the tag for an image with
Terraform 1.5.7 and Python 3.12 would be `ghcr.io/seancallaway/terraform-python:1.5.7-py3.12`.

### Gitlab CI

```yaml
terraform_validate:
  image:
    name: ghcr.io/seancallaway/terraform-python:1.7.5-py3.12
    entrypoint:
      - "/usr/bin/env"
      - "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
  stage: validate
  before_script:
    - cd $TF_PATH
    - rm -rf .terraform
    - terraform --version
    - terraform init
  script:
    - terraform validate
```

## Versions

### Python

- 3.8
- 3.9
- 3.10
- 3.11
- 3.12

### Terraform

- 1.5.7
- 1.6.6
- 1.7.5

## Meta

Distributed under the BSD 3-Clause License. See [LICENSE](LICENSE) for more information.

### Maintainers

- Sean Callaway

## Contibuting

Pull requests are welcomed!

1. Fork it (https://github.com/seancallaway/terraform-python/fork)
2. Create your feature branch (git checkout -b feature/fooBar)
3. Commit your changes (git commit -am 'Add some fooBar')
4. Push to the branch (git push origin feature/fooBar)
5. Create a new Merge Request
