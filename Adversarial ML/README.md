
# Machine Learning Vulnerabilities

This subfolder contains information about various vulnerabilities and security considerations in the field of machine learning (ML). The vulnerabilities listed here are primarily sourced from the [MITRE ATT&CK for Adversarial Machine Learning (ATLAS)](https://mitre-attack.github.io/attack-website/), providing a comprehensive overview of ML security issues.

## Table of Contents

1. [Introduction](#introduction)
2. [Example Vulnerabilities](#example-vulnerabilities)
3. [Contributing](#contributing)
4. [License](#license)

## Introduction

Machine learning systems are susceptible to various vulnerabilities and adversarial attacks. Understanding these vulnerabilities is crucial for building robust and secure ML models. This repository aims to document and categorize known ML vulnerabilities, with a focus on those identified by MITRE ATT&CK for Adversarial Machine Learning.

## Example Vulnerabilities

### 1. [LLM Prompt Injection](#)
   - Description: An adversary may craft malicious prompts as inputs to an LLM that cause the LLM to act in unintended ways. These "prompt injections" are often designed to cause the model to ignore aspects of its original instructions and follow the adversary's instructions instead.

### 2. [Poison Training Data](#)
   - Description: Adversaries may attempt to poison datasets used by a ML model by modifying the underlying data or its labels. This allows the adversary to embed vulnerabilities in ML models trained on the data that may not be easily detectable. Data poisoning attacks may or may not require modifying the labels. The embedded vulnerability is activated at a later time by data samples with an Insert Backdoor Trigger

## Contributing

Contributions are welcome! If you have information on new vulnerabilities, mitigation techniques, or general improvements, please follow these steps:

1. Fork the repository.
2. Create a new branch: `git checkout -b feature/your-feature-name`.
3. Make your changes and commit them: `git commit -m 'Add new vulnerability'`.
4. Push to the branch: `git push origin feature/your-feature-name`.
5. Submit a pull request.

Please adhere to our [Code of Conduct](CODE_OF_CONDUCT.md) when contributing.

## License

This repository is licensed under the [MIT License](LICENSE).

