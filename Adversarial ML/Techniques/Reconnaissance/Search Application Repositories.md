# [Search Application Repositories](https://atlas.mitre.org/techniques/AML.T0004)

## Overview

Adversaries may conduct searches on open application repositories, such as Google Play, the iOS App Store, the macOS App Store, and the Microsoft Store, during targeting. The objective is to identify applications that contain machine learning (ML)-enabled components.

Crafting specific search queries, adversaries aim to discover applications that leverage ML technology. This reconnaissance phase is often followed by the next step: Acquiring Public ML Artifacts.

## Mitigation

1. **Monitor Repository Activity:** Implement monitoring systems to detect unusual or unauthorized searches or downloads of ML-related applications.

2. **Review Publicly Available ML Artifacts:** Regularly review and, if necessary, restrict access to publicly available ML artifacts that may be sought by adversaries.

3. **Educate Developers:** Train application developers to be cautious about revealing ML-related components in publicly accessible repositories, emphasizing the potential security implications.

4. **Implement Access Controls:** Restrict access to certain ML-related artifacts in application repositories to authorized personnel only.

5. **Limit Release of Public Information:** Limit the public release of technical information about the machine learning stack used in an organization's products or services. Technical knowledge of how machine learning is used can be leveraged by adversaries to perform targeting and tailor attacks to the target system. Additionally, consider limiting the release of organizational information - including physical locations, researcher names, and department structures - from which technical details such as machine learning techniques, model architectures, or datasets may be inferred.



By implementing these mitigation strategies, organizations can reduce the risk of adversaries exploiting open application repositories for reconnaissance and subsequent targeted activities.
