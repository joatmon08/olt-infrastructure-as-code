# O'Reilly Live Training - Infrastructure as Code

Example setup for O'Reilly Live Training.
## Setup

1. Create a GCP account and project.
1. Set GCP project ID as `CLOUDSDK_CORE_PROJECT` environment variable.
1. Run `make setup` to create the IAM account for GitHub Actions and the networks in `dev` and `prod`.
1. Go into GCP and find the service account for `pizza-github-actions`.
    1. Create a key.
    1. Download the JSON file for the key and save it so you can add it to GitHub Actions later.
1. In your GitHub Actions workflow, set the following secrets for each environment.
   | Secret name | Value |
   | ---- | ---- |
   | CLOUDSDK_CORE_PROJECT | GCP Project ID |
   | GOOGLE_SERVICE_ACCOUNT_JSON | Base64-encoded contents of `pizza-github-actions` service account |
   | TF_SECRET_VARIABLES | Base64-encoded contents of variables for Terraform to use |
   | TF_BACKEND |  Base64-encoded contents of backend for Terraform to use |

## Usage

Each part of the solution aligns with the [concepts in the training](https://speakerdeck.com/joatmon08/infrastructure-as-code-oreilly-live-training).

## Additional Resources

- [Infrastructure as Code, 2nd Edition](https://www.oreilly.com/library/view/infrastructure-as-code/9781098114664/)
- [Infrastructure as Code (IAC) Cookbook](https://www.oreilly.com/library/view/infrastructure-as-code/9781786464910/)
- [Patterns and Practices for Infrastructure as Code](https://www.manning.com/books/patterns-and-practices-for-infrastructure-as-code)
- [Terraform: Up & Running, 2nd Edition](https://www.oreilly.com/library/view/terraform-up/9781492046899/)
- [Manage your infrastructure as code dependencies](https://www.twitch.tv/videos/1114832142)
- [Testing your Cloud Infrastructure (as Code)](https://videos.sproutvideo.com/embed/4d9ddcb31f15efc4c4/38d24cf68eafb732?autoPlay=true&lightbox=true)
- [Test-Driven Development (TDD) for Infrastructure](https://www.hashicorp.com/resources/test-driven-development-tdd-for-infrastructure)
- [Slides for Hands-on Policy as Code](https://github.com/joatmon08/policy-as-code)
- [Exploring Policy as Code for Cloud Infrastructure](https://youtu.be/eFGqqTz_5QY)
- [Applying Application Feature Toggles to Infrastructure](https://www.oreilly.com/library/view/oscon-open-source/0636920469735/)